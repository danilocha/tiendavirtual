@auth
{!! Form::open(['method' =>'DELETE', 'route' => ['productos.destroy', $product->id], 'onsubmit' => 'return confirm("¿Estas seguro que quieres eliminar ese producto?")']) !!}
<input type="submit" value="Eliminar" class="btn btn-sm btn-danger">
{!! Form::close() !!}
@endauth