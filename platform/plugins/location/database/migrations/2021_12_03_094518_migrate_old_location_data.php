<?php

use Botble\Language\Models\LanguageMeta;
use Botble\Location\Models\City;
use Botble\Location\Models\CityTranslation;
use Botble\Location\Models\Country;
use Botble\Location\Models\CountryTranslation;
use Botble\Location\Models\State;
use Botble\Location\Models\StateTranslation;
use Illuminate\Database\Migrations\Migration;

class MigrateOldLocationData extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (is_plugin_active('language')) {

            DB::statement('CREATE TABLE IF NOT EXISTS countries_backup LIKE countries');
            DB::statement('TRUNCATE TABLE countries_backup');
            DB::statement('INSERT countries_backup SELECT * FROM countries');

            DB::statement('CREATE TABLE IF NOT EXISTS states_backup LIKE states');
            DB::statement('TRUNCATE TABLE states_backup');
            DB::statement('INSERT states_backup SELECT * FROM states');

            DB::statement('CREATE TABLE IF NOT EXISTS cities_backup LIKE cities');
            DB::statement('TRUNCATE TABLE cities_backup');
            DB::statement('INSERT cities_backup SELECT * FROM cities');

            $cities = LanguageMeta::where('reference_type', State::class)
                ->where('lang_meta_code', '!=', Language::getDefaultLocaleCode())
                ->get();

            foreach ($cities as $item) {

                $originalItem = City::find($item->reference_id);

                if (!$originalItem) {
                    continue;
                }

                $originalId = LanguageMeta::where('lang_meta_origin', $item->lang_meta_origin)
                    ->where('lang_meta_code', Language::getDefaultLocaleCode())
                    ->where('reference_id', '!=', $originalItem->id)
                    ->value('reference_id');

                if (!$originalId) {
                    continue;
                }

                CityTranslation::insertOrIgnore([
                    'cities_id' => $originalId,
                    'lang_code' => $item->lang_meta_code,
                    'name'      => $originalItem->name,
                ]);

                if (is_plugin_active('real-estate')) {
                    DB::table('re_properties')->where('city_id', $originalItem->id)->update(['city_id' => $originalId]);
                }

                DB::table('cities')->where('id', $originalItem->id)->delete();
            }

            $states = LanguageMeta::where('reference_type', State::class)
                ->where('lang_meta_code', '!=', Language::getDefaultLocaleCode())
                ->get();

            foreach ($states as $item) {

                $originalItem = State::find($item->reference_id);

                if (!$originalItem) {
                    continue;
                }

                $originalId = LanguageMeta::where('lang_meta_origin', $item->lang_meta_origin)
                    ->where('lang_meta_code', Language::getDefaultLocaleCode())
                    ->where('reference_id', '!=', $originalItem->id)
                    ->value('reference_id');

                if (!$originalId) {
                    continue;
                }

                StateTranslation::insertOrIgnore([
                    'states_id'    => $originalId,
                    'lang_code'    => $item->lang_meta_code,
                    'name'         => $originalItem->name,
                    'abbreviation' => $originalItem->abbreviation,
                ]);

                City::where('state_id', $originalItem->id)->update(['state_id' => $originalId]);

                DB::table('states')->where('id', $originalItem->id)->delete();
            }

            $countries = LanguageMeta::where('reference_type', Country::class)
                ->where('lang_meta_code', '!=', Language::getDefaultLocaleCode())
                ->get();

            foreach ($countries as $item) {

                $originalItem = Country::find($item->reference_id);

                if (!$originalItem) {
                    continue;
                }

                $originalId = LanguageMeta::where('lang_meta_origin', $item->lang_meta_origin)
                    ->where('lang_meta_code', Language::getDefaultLocaleCode())
                    ->where('reference_id', '!=', $originalItem->id)
                    ->value('reference_id');

                if (!$originalId) {
                    continue;
                }

                CountryTranslation::insertOrIgnore([
                    'countries_id' => $originalId,
                    'lang_code'    => $item->lang_meta_code,
                    'name'         => $originalItem->name,
                    'nationality'  => $originalItem->nationality,
                ]);

                City::where('country_id', $originalItem->id)->update(['country_id' => $originalId]);
                State::where('country_id', $originalItem->id)->update(['country_id' => $originalId]);

                DB::table('countries')->where('id', $originalItem->id)->delete();
            }

            DB::statement('CREATE TABLE IF NOT EXISTS language_meta_backup LIKE language_meta');
            DB::statement('TRUNCATE TABLE language_meta_backup');

            DB::table('language_meta_backup')->insert(LanguageMeta::where('reference_type', State::class)->get()->toArray());
            DB::table('language_meta_backup')->insert(LanguageMeta::where('reference_type', City::class)->get()->toArray());
            DB::table('language_meta_backup')->insert(LanguageMeta::where('reference_type', Country::class)->get()->toArray());

            LanguageMeta::where('reference_type', State::class)->delete();
            LanguageMeta::where('reference_type', City::class)->delete();
            LanguageMeta::where('reference_type', Country::class)->delete();
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('countries');
        Schema::rename('countries_backup', 'countries');

        Schema::drop('states');
        Schema::rename('states_backup', 'states');

        Schema::drop('cities');
        Schema::rename('cities_backup', 'cities');

        DB::statement('INSERT language_meta_backup SELECT * FROM language_meta');
    }
}
