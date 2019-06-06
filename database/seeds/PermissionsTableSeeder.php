<?php

use Illuminate\Database\Seeder;
use Caffeinated\Shinobi\Models\Permission;

class PermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //Users
        Permission::create([
            'name'          => 'Navegar usuarios',
            'slug'          => 'users.index',
            'description'   => 'Lista y navega todos los usuarios del sistema',
        ]);
        Permission::create([
            'name'          => 'Ver detalle de usuario',
            'slug'          => 'users.show',
            'description'   => 'Ver en detalle cada usuario del sistema',
        ]);
        Permission::create([
            'name'          => 'Edicion de usuarios',
            'slug'          => 'users.edit',
            'description'   => 'Editar los datos del usuario del sistema',
        ]);
        Permission::create([
            'name'          => 'Eliminar usuarios',
            'slug'          => 'users.destroy',
            'description'   => 'Eliminar cualquier usuario del sistema',
        ]);

        //Roles
        Permission::create([
            'name'          => 'Navegar Roles',
            'slug'          => 'roles.index',
            'description'   => 'Lista y navega todos los Roles del sistema',
        ]);
        Permission::create([
            'name'          => 'Ver detalle de rol',
            'slug'          => 'roles.show',
            'description'   => 'Ver en detalle cada rol del sistema',
        ]);
        Permission::create([
            'name'          => 'Creacion de Roles',
            'slug'          => 'roles.create',
            'description'   => 'Editar los datos del rol del sistema',
        ]);
        Permission::create([
            'name'          => 'Edicion de Roles',
            'slug'          => 'roles.edit',
            'description'   => 'Editar los datos del rol del sistema',
        ]);
        Permission::create([
            'name'          => 'Eliminar Roles',
            'slug'          => 'roles.destroy',
            'description'   => 'Eliminar cualquier rol del sistema',
        ]);
        //products
        Permission::create([
            'name'          => 'Navegar Productos',
            'slug'          => 'products.index',
            'description'   => 'Lista y navega todos los Productos del sistema',
        ]);
        Permission::create([
            'name'          => 'Ver detalle de Producto',
            'slug'          => 'products.show',
            'description'   => 'Ver en detalle cada Producto del sistema',
        ]);
        Permission::create([
            'name'          => 'Creacion de Productos',
            'slug'          => 'products.create',
            'description'   => 'Editar los datos del Producto del sistema',
        ]);
        Permission::create([
            'name'          => 'Edicion de Productos',
            'slug'          => 'products.edit',
            'description'   => 'Editar los datos del Producto del sistema',
        ]);
        Permission::create([
            'name'          => 'Eliminar Productos',
            'slug'          => 'products.destroy',
            'description'   => 'Eliminar cualquier Producto del sistema',
        ]);
    }
}
