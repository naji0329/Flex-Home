<?php

namespace Database\Seeders;

use Botble\RealEstate\Models\Project;
use Botble\RealEstate\Models\Property;
use Faker\Factory;
use Illuminate\Database\Seeder;
use MetaBox;

class LatLongSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Factory::create();

        foreach (Property::whereNull('latitude')->orWhereNull('longitude')->orWhere('project_id', 0)->get() as $property) {
            if (!$property->latitude) {
                $property->latitude = $faker->latitude(42.4772, 44.0153);
            }

            if (!$property->longitude) {
                $property->longitude = $faker->longitude(-74.7624, -76.7517);
            }

            if (!$property->project_id) {
                $property->project_id = $property->id <= 17 ? $faker->numberBetween(1, 6) : $faker->numberBetween(7, 12);
            }

            $property->save();
        }

        foreach (Project::whereNull('latitude')->orWhereNull('longitude')->get() as $project) {
            if (!$project->latitude) {
                $project->latitude = $faker->latitude(42.4772, 44.0153);
            }

            if (!$project->longitude) {
                $project->longitude = $faker->longitude(-74.7624, -76.7517);
            }

            $project->save();
        }

        foreach (Property::get() as $property) {
            if ($property->id % 2 == 0) {
                MetaBox::saveMetaBoxData($property, 'video', [
                    'thumbnail' => $property->id % 4 == 0 ? 'properties/property-video-thumb.jpg' : '',
                    'url'       => 'https://www.youtube.com/watch?v=UfEiKK-iX70'
                ]);
            }
        }

        foreach (Project::get() as $project) {
            if ($project->id % 2 == 0) {
                MetaBox::saveMetaBoxData($project, 'video', [
                    'thumbnail' => $project->id % 4 == 0 ? 'properties/property-video-thumb.jpg' : '',
                    'url'       => 'https://www.youtube.com/watch?v=UfEiKK-iX70'
                ]);
            }
        }

	    foreach (\Botble\Blog\Models\Post::get() as $post) {
            $post->views = $faker->numberBetween(100, 2500);
            $post->save();
	    }
    }
}
