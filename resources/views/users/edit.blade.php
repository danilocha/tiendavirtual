@extends('layouts.app')

@section('content')
<div class="container">
    <div class="card padding">
        <header>
            <h4>Editar producto</h4>
            <p>{{$user->title}}</p>
        </header>
        <div class="card-body">
            @include('users.form')
        </div>
    </div>

</div>
@endsection