<?php

namespace Botble\Location\Imports;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Location\Models\City;
use Botble\Location\Models\CityTranslation;
use Botble\Location\Models\Country;
use Botble\Location\Models\CountryTranslation;
use Botble\Location\Models\State;
use Botble\Location\Models\StateTranslation;
use Botble\Location\Repositories\Interfaces\CityInterface;
use Botble\Location\Repositories\Interfaces\CountryInterface;
use Botble\Location\Repositories\Interfaces\StateInterface;
use Botble\Slug\Repositories\Interfaces\SlugInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use Language;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\SkipsErrors;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Validators\Failure;

class LocationImport implements
    ToModel,
    WithHeadingRow,
    WithMapping,
    WithValidation,
    SkipsOnFailure,
    SkipsOnError,
    WithChunkReading
{
    use Importable, SkipsFailures, SkipsErrors, ImportTrait;

    /**
     * @var CityInterface
     */
    protected $cityRepository;

    /**
     * @var Request
     */
    protected $request;

    /**
     * @var mixed
     */
    protected $validatorClass;

    /**
     * @var string
     */
    protected $importType = 'all';

    /**
     * @var int
     */
    protected $rowCurrent = 1; // include header

    /**
     * @var mixed
     */
    protected $getActiveLanguage;

    /**
     * @param CityInterface $cityRepository
     * @param StateInterface $stateRepository
     * @param CountryInterface $countryRepository
     * @param Request $request
     */
    public function __construct(
        CityInterface $cityRepository,
        StateInterface $stateRepository,
        CountryInterface $countryRepository,
        SlugInterface $slugRepository,
        Request $request
    ) {
        $this->cityRepository = $cityRepository;
        $this->stateRepository = $stateRepository;
        $this->countryRepository = $countryRepository;
        $this->slugRepository = $slugRepository;
        $this->request = $request;
        $this->countries = collect([]);
        $this->states = collect([]);
        $this->isRealEstatePluginActive = is_plugin_active('real-estate');

        if (defined('LANGUAGE_MODULE_SCREEN_NAME')) {
            $this->getActiveLanguage = Language::getActiveLanguage(['lang_code', 'lang_is_default']);
        }
    }

    /**
     * @param array $row
     * @return City|Country|State|false|\Illuminate\Database\Eloquent\Model
     */
    public function model(array $row)
    {
        $importType = $this->getImportType();

        $stateName = $this->request->input('state');
        $countryId = $this->request->input('country');

        if ($importType == 'all') {
            switch ($row['import_type']) {
                case 'city':
                    $state = $this->getStateByName($stateName, $countryId);
                    return $this->storeCity($state);
                case 'state':
                    return $this->storeState();
                case 'country':
                    return $this->storeCountry();
            }
        }

        if ($importType == 'countries' && $row['import_type'] == 'country') {
            return $this->storeCountry();
        }

        if ($importType == 'states' && $row['import_type'] == 'state') {
            return $this->storeState();
        }

        if ($importType == 'cities' && $row['import_type'] == 'city') {
            $state = $this->getStateByName($stateName, $countryId);

            return $this->storeCity($state);
        }

        return null;
    }

    /**
     * @return string
     */
    public function getImportType()
    {
        return $this->importType;
    }

    /**
     * @param string $importType
     * @return self
     */
    public function setImportType($importType)
    {
        $this->importType = $importType;

        return $this;
    }

    /**
     * @param string $name
     * @param string $country
     * @return \Eloquent|\Illuminate\Database\Eloquent\Builder|\Illuminate\Database\Eloquent\Model|object|null
     */
    protected function getStateByName($name, $countryId)
    {
        $collection = $this->states
            ->where('keyword', $name)
            ->where('country', $this->request->input('country_temp'))
            ->first();

        if ($collection) {
            return $collection['model'];
        }

        $isCreateNew = false;
        if (is_numeric($name)) {
            $state = $this->stateRepository->getFirstBy(['id' => $name, 'country_id' => $countryId]);
        } else {
            $state = $this->stateRepository->getFirstBy(['name' => $name, 'country_id' => $countryId]);
        }

        if (!$state) {
            $state = $this->stateRepository->create(['name' => $name, 'country_id' => $countryId]);
            $isCreateNew = true;
        }

        $this->states->push(collect([
            'keyword'       => $name,
            'is_create_new' => $isCreateNew,
            'model'         => $state,
            'country'       => $this->request->input('country_temp'),
        ]));

        return $state;
    }

    /**
     * @param State $state
     * @return false|\Illuminate\Database\Eloquent\Model|null
     */
    public function storeCity($state)
    {
        $this->request->merge(['state_id' => $state->id]);
        $row = $this->request->input();

        $city = $this->cityRepository->create($row);
        if ($this->isRealEstatePluginActive) {
            $slug = Arr::get($row, 'slug') ?: Arr::get($row, 'name');
            if (function_exists('create_city_slug')) {
                $slug = create_city_slug($slug, $city);
            }

            $city->slug = $slug;
            $city->save();
        }

        if ($this->getActiveLanguage) {
            foreach ($this->getActiveLanguage as $language) {
                if ($language->lang_is_default) {
                    continue;
                }

                CityTranslation::insertOrIgnore([
                    'cities_id' => $city->id,
                    'lang_code' => $language->lang_code,
                    'name'      => Arr::get($row, 'name_' . $language->lang_code) ?: Arr::get($row, 'name'),
                ]);
            }
        }

        $this->onSuccess($city);

        return $city;
    }

    /**
     * @return State
     */
    public function storeState()
    {
        $row = $this->request->input();
        $collection = $this->states
            ->where('keyword', $row['name'])
            ->where('country', $row['country_temp'])
            ->where('is_create_new', true)
            ->first();

        if ($collection) {
            $state = $collection['model'];
        } else {
            $state = $this->stateRepository->create($row);
        }

        if ($this->getActiveLanguage) {
            foreach ($this->getActiveLanguage as $language) {
                if ($language->lang_is_default) {
                    continue;
                }

                StateTranslation::insertOrIgnore([
                    'states_id'    => $state->id,
                    'lang_code'    => $language->lang_code,
                    'name'         => Arr::get($row, 'name_' . $language->lang_code) ?: Arr::get($row, 'name'),
                    'abbreviation' => Arr::get($row, 'abbreviation_' . $language->lang_code) ?: Arr::get($row,
                        'abbreviation'),
                ]);
            }
        }

        $this->onSuccess(collect([
            'name'        => $state->name,
            'country'     => $row['country_temp'],
            'import_type' => 'state',
            'model'       => $state,
        ]));

        $this->states->push(collect([
            'keyword'       => $state->name,
            'is_create_new' => false,
            'model'         => $state,
            'country'       => $row['country_temp'],
        ]));

        return $state;
    }

    /**
     * @return Country
     */
    public function storeCountry()
    {
        $row = $this->request->input();
        $collection = $this->countries
            ->where('keyword', $row['name'])
            ->where('is_create_new', true)
            ->first();

        if ($collection) {
            $country = $collection['model'];
        } else {
            $country = $this->countryRepository->create($row);
        }

        if ($this->getActiveLanguage) {
            foreach ($this->getActiveLanguage as $language) {
                if ($language->lang_is_default) {
                    continue;
                }

                CountryTranslation::insertOrIgnore([
                    'countries_id' => $country->id,
                    'lang_code'    => $language->lang_code,
                    'name'         => Arr::get($row, 'name_' . $language->lang_code) ?: Arr::get($row, 'name'),
                    'nationality'  => Arr::get($row, 'nationality_' . $language->lang_code) ?: Arr::get($row,
                        'nationality'),
                ]);
            }
        }

        $this->countries->push([
            'keyword'    => $country->name,
            'country_id' => $country->id,
        ]);

        $this->onSuccess(collect([
            'name'        => $country->name,
            'country'     => $row['country_temp'],
            'import_type' => 'country',
            'model'       => $country,
        ]));

        return $country;
    }

    /**
     * @return null
     */
    public function onStoreCityFailure()
    {
        if (method_exists($this, 'onFailure')) {
            $failures[] = new Failure(
                $this->rowCurrent,
                'state',
                [__('State name or ID ":name" does not exists', ['name' => $this->request->input('state')])],
                []
            );

            $this->onFailure(...$failures);
        }

        return null;
    }

    /**
     * Change value before insert to model
     *
     * @param array $row
     */
    public function map($row): array
    {
        ++$this->rowCurrent;
        $row = $this->mapLocalization($row);
        if (in_array($row['import_type'], ['state', 'city'])) {
            $row = $this->setCountryToRow($row);
        }

        $this->request->merge($row);

        return $row;
    }

    /**
     * @param array $row
     * @return array
     */
    public function mapLocalization($row): array
    {
        $row['status'] = strtolower(Arr::get($row, 'status'));
        if (!in_array($row['status'], BaseStatusEnum::values())) {
            $row['status'] = BaseStatusEnum::PUBLISHED;
        }

        $row['import_type'] = strtolower(Arr::get($row, 'import_type'));
        if (!in_array($row['import_type'], ['city', 'country'])) {
            $row['import_type'] = 'state';
        }

        $this->setValues($row, [['key' => 'order', 'type' => 'integer']]);

        $row['is_featured'] = !!Arr::get($row, 'is_featured');
        $row['country_temp'] = Arr::get($row, 'country');

        return $row;
    }

    /**
     * @param array $row
     * @return array
     */
    protected function setCountryToRow(array $row): array
    {
        $value = trim($row['country']);
        $countryId = null;
        if ($value) {
            $countryId = $this->getCountryId($value);
        }

        $row['country_id'] = $countryId;
        $row['country'] = $countryId;

        return $row;
    }

    /**
     * @param int $value
     * @param string $langCode
     * @return int|null
     */
    public function getCountryId($value)
    {
        $country = $this->countries->where('keyword', $value)->first();

        if ($country) {
            $countryId = $country['country_id'];
        } else {
            $isCreateNew = false;
            if (is_numeric($value)) {
                $country = $this->countryRepository->findById($value);
            } else {
                $country = $this->countryRepository->getFirstBy(['name' => $value]);
            }

            if (!$country) {
                $country = $this->countryRepository->create([
                    'name'        => $value,
                    'nationality' => $this->getNationalityFromName($value),
                    'status'      => BaseStatusEnum::PUBLISHED,
                ]);
                $isCreateNew = true;
            }

            $countryId = $country->id;

            $this->countries->push([
                'keyword'       => $value,
                'country_id'    => $countryId,
                'is_create_new' => $isCreateNew,
            ]);
        }

        return $countryId;
    }

    /**
     * @param string $name
     * @return string
     */
    private function getNationalityFromName(string $name)
    {
        $explode = explode(' ', $name);
        if (count($explode) > 2) {
            return Str::substr($explode[0], 0, 1) . Str::substr($explode[1], 0, 1);
        }

        return Str::substr($name, 0, 2);
    }

    /**
     * @return array
     */
    public function customValidationMessages()
    {
        return method_exists($this->getValidatorClass(), 'messages') ? $this->getValidatorClass()->messages() : [];
    }

    /**
     * @return mixed
     */
    public function getValidatorClass()
    {
        return $this->validatorClass;
    }

    /**
     * @param mixed $validatorClass
     * @return self
     */
    public function setValidatorClass($validatorClass): self
    {
        $this->validatorClass = $validatorClass;

        return $this;
    }

    /**
     * @return array
     */
    public function rules(): array
    {
        return method_exists($this->getValidatorClass(), 'rules') ? $this->getValidatorClass()->rules() : [];
    }

    /**
     * @return array
     */
    public function customValidationAttributes()
    {
        return method_exists($this->getValidatorClass(), 'attributes') ? $this->getValidatorClass()->attributes() : [];
    }

    /**
     * @return int
     */
    public function chunkSize(): int
    {
        return 100;
    }
}
