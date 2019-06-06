{!! Form::open(['route' => [$product->url(), $product->id],'method' => $product->method(),'class' => 'app-form', 'files' => true]) !!}
    <div>
        {!! Form::label('title', 'Titulo del producto') !!}
        {!! Form::text('title',$product->title,['class' => 'form-control']) !!}
    </div>
    <div>
        {!! Form::label('description', 'Descripcion del producto') !!}
        {!! Form::textarea('description',$product->description,['class' => 'form-control']) !!}
    </div>
    <div>
        {{Form::file('cover')}}
    </div>
    <div>
        {!! Form::label('price', 'Precio del producto') !!}
        {!! Form::number('price',$product->price,['class' => 'form-control']) !!}
    </div>
    <div>
        {!! Form::label('tags', 'Etiquetas (palabras separadas por comas)') !!}
        {!! Form::text('tags',$product->tags,['class' => 'form-control', 'data-role' => 'tagsinput']) !!}
    </div>
    <div>
        <input type="submit" value="Guardar" class="btn btn-primary">
    </div>
{!! Form::close() !!}