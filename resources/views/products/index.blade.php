
@extends('layouts.app')

@section('content')
    <div class="container">
    @if(session('info'))
        <div class="alert alert-success">{{session('info')}}</div>
        @endif
        <h1>
        Busqueda de productos
        {{Form::open(['route' => 'productos.index', 'method' => 'get', 'class' => 'form-inline pull-right']) }}
            <div class="formgroup">
                {{Form::text('title', null, ['class' => 'form-control', 'placeholder' => 'Nombre'])}}
            </div>
            <div class="formgroup">
                {{Form::text('id', null, ['class' => 'form-control', 'placeholder' => 'ID'])}}
            </div>
            <div class="formgroup">
                {{Form::text('tags', null, ['class' => 'form-control', 'placeholder' => 'Etiquetas'])}}
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">
                    <span class="glyphicon glyphicon-search">Buscar</span>
                </button>
            </div>
            {{Form::close()}}
        </h1>
    <div class="panel-body row">
       
        
       
                @foreach($products as $product)
                <div class="card col-md-3">
                    <img src=" productos/imagen/{{$product->id.'.'.$product->image_url}} " class="card-img-top" alt="...">
                    <div class="card-title">ID: {{$product->id}} Producto: {{$product->title}}</div>
                    <div class="card-text">{{$product->description}}</div>
                    <div class="panel-footer">{{$product->price}}</div>
                    <div class="card-footer text-muted">
                        <a href="{{ route('products.show', $product->id)}}" 
                        class="btn btn-sm btn-primary">ver</a>
                        <add-product-btn :product='{!! json_encode($product) !!}'></add-product-btn>
                        @can('products.edit')
                        
                        <a href="{{ route('products.edit', $product->id)}}" 
                        class="btn btn-sm btn-primary">Editar</a>
                        
                        @endcan
                        @can('products.destroy')
                        
                        @include('products.delete')
                        
                        @endcan
                    </div>
                    <div class="card-footer">
                        @forelse($product->tags as $tag)
                            <span>{{ $tag->name }}</span>
                            @empty
                            <em>Sin etiquetas</em>
                        @endforelse

                    </div>
                </div>
                

                @endforeach
            
    </div>
        
        <div class="actions d-flex justify-content-center">
            {{$products->links()}}
        </div>
    </div>
    @can('products.create')
    <div class="btn-float">
        <a href="{{route('products.create')}}">Agregar producto</a>
    </div>
    @endcan
    
@endsection