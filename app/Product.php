<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Conner\Tagging\Taggable;

class Product extends Model
{
    use Taggable;
    
    public $fillable = ['title', 'image_url', 'description', 'price', 'id'];

    public function url(){
        return $this->id ? 'productos.update' : 'productos.store';
    }

    public function method(){
        return $this->id ? 'PUT' : 'POST';
    }

    //Scope
    public function scopeTitle($query, $title)
    {
        if($title)
        return $query->where('title', 'LIKE', "%$title%");
    }
    public function scopeId($query, $id)
    {
        if($id)
        return $query->where('id', 'LIKE', "%$id%");
    }
    public function scopeTags($query, $tags)
    {
        if($tags)
        return DB::table('tagging-tagged')->where('tags', 'LIKE', "%$tags%");
    }
}
