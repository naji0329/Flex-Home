<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\RealEstate\Models\Account;
use Botble\RealEstate\Models\Property;
use Faker\Factory;
use Illuminate\Support\Str;

class AccountSeeder extends BaseSeeder
{
    public function run()
    {
        $faker = Factory::create();

        Account::truncate();

        $files = $this->uploadFiles('accounts');

        Account::create([
            'first_name'   => $faker->firstName,
            'last_name'    => $faker->lastName,
            'email'        => 'john.smith@botble.com',
            'username'     => Str::slug($faker->unique()->userName),
            'password'     => bcrypt('12345678'),
            'dob'          => $faker->dateTime,
            'phone'        => $faker->e164PhoneNumber,
            'description'  => $faker->realText(30),
            'credits'      => 10,
            'confirmed_at' => now(),
            'avatar_id'    => $files[$faker->numberBetween(0, 9)]['data']->id,
        ]);

        for ($i = 0; $i < 10; $i++) {
            Account::create([
                'first_name'   => $faker->firstName,
                'last_name'    => $faker->lastName,
                'email'        => $faker->email,
                'username'     => Str::slug($faker->unique()->userName),
                'password'     => bcrypt($faker->password),
                'dob'          => $faker->dateTime,
                'phone'        => $faker->e164PhoneNumber,
                'description'  => $faker->realText(30),
                'credits'      => $faker->numberBetween(1, 10),
                'confirmed_at' => now(),
                'avatar_id'    => $files[$i]['data']->id,
            ]);
        }

        foreach (Account::get() as $account) {
            if ($account->id % 2 == 0) {
                $account->is_featured = true;
                $account->save();
            }
        }

        $properties = Property::get();

        foreach ($properties as $property) {
            $property->author_id = Account::inRandomOrder()->value('id');
            $property->author_type = Account::class;
            $property->save();
        }
    }
}
