<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cotizacion extends Model
{
    protected $fillable = ['nombre', 'email', 'telefono'];
}
