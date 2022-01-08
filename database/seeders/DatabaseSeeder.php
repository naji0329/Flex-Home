<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;

class DatabaseSeeder extends BaseSeeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->activateAllPlugins();

        $this->call(LanguageSeeder::class);
        $this->call(CurrencySeeder::class);
        $this->call(CategorySeeder::class);
        $this->call(FacilitySeeder::class);
        $this->call(FeatureSeeder::class);
        $this->call(PackageSeeder::class);
        $this->call(AccountSeeder::class);
        $this->call(UserSeeder::class);
        $this->call(SettingSeeder::class);
        $this->call(PageSeeder::class);
        $this->call(LatLongSeeder::class);
        $this->call(MenuSeeder::class);
        $this->call(ThemeOptionSeeder::class);
        $this->call(BlogSeeder::class);
        $this->call(CareerSeeder::class);
        $this->call(ProjectSeeder::class);
        $this->call(PropertySeeder::class);

        $this->uploadFiles('banner');
        $this->uploadFiles('cities');
        $this->uploadFiles('logo');
        $this->uploadFiles('projects');
        $this->uploadFiles('properties');
        $this->uploadFiles('users');
    }
}
