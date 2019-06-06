<div>
        {!! Form::label('name', 'Nombre') !!}
        {!! Form::text('name', null,['class' => 'form-control']) !!}
    </div>
    <div>
        {!! Form::label('slug', 'URL amigable') !!}
        {!! Form::text('slug', null,['class' => 'form-control']) !!}
    </div>
    <div>
        {!! Form::label('description', 'descripcion del role') !!}
        {!! Form::text('description',null,['class' => 'form-control']) !!}
    </div>
    <h3>Permiso especial</h3>
    <div class="form-group">
    <label for="">{{Form::radio('special', 'all-access')}} Acceso Total</label>
    <label for="">{{Form::radio('special', 'no-access')}} Ningun acceso</label>
    </div>
    <div>
        <ul class="list-unstyled">
            @foreach($permissions as $permission)
                <li>
                    <label for="">
                        {{Form::checkbox('permissions[]', $permission->id, null)}}
                        {{ $permission->name }}
                        <em>({{$permission->description ?: 'Sin descripcion'}})</em>
                    </label>
                </li>
            @endforeach
        </ul>
    </div>
    <div>
       {{ Form::submit('Guardar', ['class' => 'btn btn-sm btn-primary']) }}
    </div>
