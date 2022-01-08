<?php

namespace Botble\Location\Imports;

use Botble\Location\Models\State;

class ValidateLocationImport extends LocationImport
{
    /**
     * @return null
     */
    public function storeCountry()
    {
        $country = collect($this->request->input());

        $collect = collect([
            'name'        => $country['name'],
            'country'     => $country['country_temp'],
            'import_type' => 'country',
            'model'       => $country,
        ]);

        $this->onSuccess($collect);

        $this->countries->push([
            'keyword'    => $country['name'],
            'country_id' => 1,
        ]);

        return null;
    }

    /**
     * @return null
     */
    public function storeState()
    {
        $state = collect($this->request->input());

        $collect = collect([
            'name'        => $state['name'],
            'country'     => $state['country_temp'],
            'import_type' => 'state',
            'model'       => $state,
        ]);

        $this->onSuccess($collect);

        return null;
    }

    /**
     * @return null
     */
    public function storeCity($state)
    {
        if (!$state) {
            $this->onStoreCityFailure();
        }

        return null;
    }

    public function mapLocalization($row): array
    {
        $row = parent::mapLocalization($row);

        if ($row['import_type'] == 'country') {
            $this->countries->push([
                'keyword'    => $row['name'],
                'country_id' => 1,
            ]);
        }

        return $row;
    }

    /**
     * @param array $row
     * @return array
     */
    protected function setCountryToRow(array $row): array
    {
        return $row;
    }

    /**
     * @param string $name
     * @param string $country
     * @return \Illuminate\Database\Eloquent\Model
     */
    protected function getStateByName($name, $countryId)
    {
        return new State;
    }
}
