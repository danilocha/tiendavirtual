<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class ProductsCollection extends ResourceCollection
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
                    'numbrePrice' =>$element->price,
                    'imagen' =>$element->image_url,
                    'description' =>$element->description,                   
                    'tags' => $element->tags        
                ];
            })
        ];
    }
}

