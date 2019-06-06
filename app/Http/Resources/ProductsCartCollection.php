<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class ProductsCartCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'data' => $this->collection->transform(function($element){
                return[
                    'title' =>$element->title,
                    'id' =>$element->id,
                    'total' =>($element->price * $element->pivot->amount),
                    'numbrePrice' =>$element->price,
                    'imagen' =>$element->image_url,
                    'description' =>$element->description,
                    'idPivot' =>$element->pivot->id,    
                    'amount' =>$element->pivot->amount                
                ];
            })
        ];
    }
}
