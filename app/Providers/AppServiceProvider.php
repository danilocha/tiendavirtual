<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Schema;
use App\ShoppingCart;
// use App\http\Controllers\Session;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(120);
        

        View::composer('*',function($view){
            $sessionName= '$shopping_cart_id';
            $shopping_cart_id = \Session::get($sessionName);
            $shopping_cart = ShoppingCart::findOrCreateById($shopping_cart_id);
            \Session::put($sessionName, $shopping_cart->id);
            $view->with('productsCount',$shopping_cart->productsCount());
        });
    }
}
