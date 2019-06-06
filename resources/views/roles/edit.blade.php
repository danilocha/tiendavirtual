@extends('layouts.app')

@section('content')
<div class="container">
    <div class="card padding">
        <header>
            <h4>Editar Role</h4>
            <p>{{$role->title}}</p>
        </header>
        <div class="card-body">
        {!! Form::model($role, ['route' => ['roles.update', $role->id],'method' => 'PUT','class' => 'app-form', 'files' => true]) !!}
            @include('roles.form')
            {!! Form::close() !!}
        </div>
    </div>

</div>
@endsection