@extends('layouts.app')

@section('content')
    <div class="container">
        <h1></h1>
    <div class="panel-body">
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th width="10px">ID</th>
                    <th>Role</th>
                    <th>Descripcion</th>
                    <th colspan="3">Opciones</th>
                </tr>
            </thead>
            <tbody>
                @foreach($roles as $role)
                <tr>
                    <td>{{$role->id}}</td>
                    <td>{{$role->name}}</td>
                    <td>{{$role->description}}</td>
                    <td>
                    <a href="{{ route('roles.show', $role->id)}}" 
                    class="btn btn-sm btn-default">ver</a>
                    </td>

                    @can('roles.edit')
                    <td>
                    <a href="{{ route('roles.edit', $role->id)}}" 
                    class="btn btn-sm btn-default">Editar</a>
                    </td>
                    @endcan
                    @can('roles.destroy')
                    <td>
                    @include('roles.delete')
                    </td>
                    @endcan
                </tr>

                @endforeach
            </tbody>
        </table>
    </div>
        
        <div class="actions d-flex justify-content-center">
            {{$roles->links()}}
        </div>
    </div>
    @can('roles.create')
    <div class="btn-float">
        <a href="{{route('roles.create')}}">Agregar role</a>
    </div>
    @endcan
@endsection