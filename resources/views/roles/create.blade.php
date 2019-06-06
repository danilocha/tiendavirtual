@extends('layouts.app')

@section('content')
<div class="container">
    <div class="card padding">
        <header>
            <h4>Crear nuevo rol</h4>
        </header>
        <div class="card-body">
        {!! Form::open(['route' => 'roles.store']) !!}
        @include('roles.form')
        {!! Form::close() !!}
        </div>
    </div>

</div>
@endsection