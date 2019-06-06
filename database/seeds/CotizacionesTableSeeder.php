<?php

use Illuminate\Database\Seeder;
use App\Cotizacion;

class CotizacionesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(Cotizacion::class, 5)->create;
    }
}
