@extends('layouts.app')

@section('content')
    <div class="row justify-content-sm-center">
        <div class="col-x12 col-sm-10 col-md-7 col-lg-6">
            <div class="card">
                <header class="padding text-center bg-primary">
                   
                </header>
                <div class="card-body padding">
                    <h1 class="card-title">{{$user->name}}</h1>
                    <h4 class="card-subtitle">{{$user->email}}</h4>
                    
                    
                </div>
            </div>
        </div>
    </div>
@endsection