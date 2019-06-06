<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/carrito','ShoppingCartController@show')->name('shopping_cart.show');
Route::get('/carrito/productos','ShoppingCartController@products')->name('shopping_cart.products');

Route::get('/pagar','PaymentsController@pay')->name('payments.pay');
Route::get('/pagar/completar','PaymentsController@execute')->name('payments.execute');

Route::resource('productos', 'ProductsController');
Route::resource('in_shopping_carts', 'ProductInShoppingCartsController',[
    "only" => ["store","destroy","update"]
]);

Route::get('productos/imagen/{filename}', function($filename){
    $path = storage_path("app/images/$filename");
    if(!\File::get($path)) abort(404);
    $file = \File::get($path);
    $type = \File::mimeType($path);
    $response = Response::make($file,200);
    $response->header("Content-Type",$type);

    return $response;
});

Route::get('carrito-pdf', 'ProductInShoppingCartsController@exportPdf')->name('carrito.pdf');


Route::get('/home', 'HomeController@index')->name('home');

Route::resource('cotizaciones', 'cotizacionesController', ['except' => 'create']);
//Routes

Route::middleware(['auth'])->group(function(){
    //Roles
    Route::post('roles/store', 'RoleController@store')->name('roles.store')
    ->middleware('permission:roles.create');

    Route::get('roles', 'RoleController@index')->name('roles.index')
    ->middleware('permission:roles.index');

    Route::get('roles/create', 'RoleController@create')->name('roles.create')
    ->middleware('permission:roles.create');

    Route::put('roles/{role}', 'RoleController@update')->name('roles.update')
    ->middleware('permission:roles.edit');

    Route::get('roles/{role}', 'RoleController@show')->name('roles.show')
    ->middleware('permission:roles.show');

    Route::delete('roles/{role}', 'RoleController@destroy')->name('roles.destroy')
    ->middleware('permission:roles.destroy');

    Route::get('roles/{role}/edit', 'RoleController@edit')->name('roles.edit')
    ->middleware('permission:roles.edit');

    //Productos
    Route::post('productos/store', 'ProductsController@store')->name('products.store')
    ->middleware('permission:products.create');

    Route::get('productos/create', 'ProductsController@create')->name('products.create')
    ->middleware('permission:products.create');

    Route::put('productos/{product}', 'ProductsController@update')->name('products.update')
    ->middleware('permission:products.edit');

    Route::get('productos/{product}', 'ProductsController@show')->name('products.show')
    ->middleware('permission:products.show');

    Route::delete('productos/{product}', 'ProductsController@destroy')->name('products.destroy')
    ->middleware('permission:products.destroy');

    Route::get('productos/{product}/edit', 'ProductsController@edit')->name('products.edit')
    ->middleware('permission:products.edit');

    //Users
    

    Route::get('usuarios', 'UserController@index')->name('users.index')
    ->middleware('permission:users.index');

    Route::put('usuarios/{user}', 'UserController@update')->name('users.update')
    ->middleware('permission:users.edit');

    Route::get('usuarios/{user}', 'UserController@show')->name('users.show')
    ->middleware('permission:users.show');

    Route::delete('usuarios/{user}', 'UserController@destroy')->name('users.destroy')
    ->middleware('permission:users.destroy');

    Route::get('usuarios/{user}/edit', 'UserController@edit')->name('users.edit')
    ->middleware('permission:users.edit');
    
});