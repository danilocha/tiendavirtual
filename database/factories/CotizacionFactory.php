<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\Cotizacion;
use Faker\Generator as Faker;

$factory->define(Cotizacion::class, function (Faker $faker) {
    return [
        'nombre' => $faker->sentence,
        'email' => $faker->sentence,
        'description' => $faker->numberBetween
        
    ];
});
