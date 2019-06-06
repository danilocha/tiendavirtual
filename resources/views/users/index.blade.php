@extends('layouts.app')

@section('content')
    <div class="container">
        <h1></h1>
    <div class="panel-body">
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th width="10px">ID</th>
                    <th>Nombre</th>
                    
                    <th colspan="3">Opciones</th>
                </tr>
            </thead>
            <tbody>
                @foreach($users as $user)
                <tr>
                    <td>{{$user->id}}</td>
                    <td>{{$user->name}}</td>
                    <td>
                    <a href="{{ route('users.show', $user->id)}}" 
                    class="btn btn-sm btn-default">ver</a>
                    </td>

                    @can('users.edit')
                    <td>
                    <a href="{{ route('users.edit', $user->id)}}" 
                    class="btn btn-sm btn-default">Editar</a>
                    </td>
                    @endcan
                    @can('users.destroy')
                    <td>
                    @include('users.delete')
                    </td>
                    @endcan
                </tr>

                @endforeach
            </tbody>
        </table>
    </div>
        
        <div class="actions d-flex justify-content-center">
            {{$users->links()}}
        </div>
    </div>

@endsection