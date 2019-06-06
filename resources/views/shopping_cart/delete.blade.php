{!! Form::open(['url' => '/shopping_cart/'.$product->pivot->id, 'method' => 'DELETE', 'class' => 'inline-block'])  !!}
  <input type="submit" name="" value="Eliminar" class="btn btn-link red-text no-padding no-margin no-transform">
{!! Form::close() !!}