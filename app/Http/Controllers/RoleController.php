<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Caffeinated\Shinobi\Models\Role;
use Caffeinated\Shinobi\Models\Permission;

use App\ShoppingCart;
use App\Http\Resources\ProductsCollection;

class RoleController extends Controller
{
    public function __construct(){
        $this->middleware('auth', ['except' => ['index','show']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        
        
        $roles = role::paginate();

        if($request->wantsJson()){
            
            return new ProductsCollection($roles);
        }

        return view('roles.index',['roles' => $roles]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $role = role::find($id);
        return view('roles.show', ['role' => $role]);
    }

    public function create()
    {
        $role = new Role;
        $permissions = Permission::get();
        return view ('roles.create', compact('permissions'));
    }

    public function store(Request $request)
    {
        $role = Role::create($request->all());

        $role->permissions()->sync($request->get('permissions'));
        

        return redirect()->route('roles.edit', $role->id)
        ->with ('info','Role Guardado con exito');
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Role $role)
    {
       
        $permissions = Permission::get();
        return view("roles.edit", compact('role', 'permissions'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,Role $role)
    {
        //actualizar role
        $role->update($request->all());

        //actualizar permisos

        $role->permissions()->sync($request->get('permissions'));
        return redirect()->route('roles.edit', $role->id)
            ->with('info', 'Role actualizado');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        role::destroy($id);
        return redirect('/roles');
    }
}
