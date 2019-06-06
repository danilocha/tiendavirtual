{!! Form::model($user, ['route' => ['users.update', $user->id],'method' => 'PUT','class' => 'app-form', 'files' => true]) !!}
    <div>
        {!! Form::label('name', 'Nombre del usuario') !!}
        {!! Form::text('name',$user->name,['class' => 'form-control']) !!}
    </div>
    <div>
        {!! Form::label('email', 'Email del usuario') !!}
        {!! Form::text('email',$user->email,['class' => 'form-control']) !!}
    </div>
    <h3>Lista de roles</h3>
    <div>
        <ul class="list-unstyled">
            @foreach($roles as $role)
                <li>
                    <label for="">
                        {{Form::checkbox('roles[]', $role->id, null)}}
                        {{ $role->name }}
                        <em>({{$role->description ?: 'Sin descripcion'}})</em>
                    </label>
                </li>
            @endforeach
        </ul>
    </div>
    <div>
       {{ Form::submit('Guardar', ['class' => 'btn btn-sm btn-primary']) }}
    </div>
{!! Form::close() !!}