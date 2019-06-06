@extends('layouts.app')

@section('content')
<div class="container">
    <div class="card padding">
        <header>
            <h2>Mi carrito de compras</h2>
        </header>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-12 col-md-6 payments">           
                <products-shopping-component></products-shopping-component>
            </div>
            <div class="col-12 col-md-6">
                <p>Paga tu compra facil y seguro con cualquiera de estos metodos de pago</p>
                <div>
                    <a href="/pagar" class="btn btn-primary">Pagar</a>
                    <a href=" {!! route('carrito.pdf') !!} " class="btn btn-danger">Descarga tu cotizacion</a>
                </div>
            </div>
        </div>
        
    </div>
</div>
@endsection