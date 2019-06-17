<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\ShoppingCart;
use App\Http\Resources\ProductsCollection;


class ProductsController extends Controller
{
    public function __construct(){
        $this->middleware('auth', ['except' => ['index','show']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $title = $request->get('title');
        $id = $request->get('id');
        $tags = $request->get('tags');
        
        $products = Product::orderBy('id', 'DESC')
            ->title($title)
            ->id($id)
            ->tags($tags)
            ->paginate(16);

        if($request->wantsJson()){
            
            return new ProductsCollection($products);
        }  

        return view('products.index',['products' => $products]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $product = new Product;
        return view ('products.create',["product" => $product]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $hasFile = $request->hasFile('cover') && $request->cover->isValid(

        );
        $tags = explode(',', $request->tags);
        $options = [
            'title' => $request->title,
            'description' => $request->description,
            'price' => $request->price,
            'tags' => $request->tags,

        ];
        if($hasFile){
            $extension = $request->cover->extension();
        
        $options = [
            'title' => $request->title,
            'description' => $request->description,
            'price' => $request->price,
            'image_url' => $extension,
            'tags' => $request->tags,
        ];
    };
        $product = Product::create($options);
        if($product){
            $product->tag($tags);

            if($hasFile){
                $request->cover->storeAs('images',$product->id.'.'.$extension);
            }
            return redirect('/productos')->with('info', 'Producto creado con exito');
        }else{
            return view('products.create');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $product = Product::find($id);
        return view('products.show', ['product' => $product]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $product = Product::find($id);
        return view("products.edit",["product" => $product]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $product = Product::find($id);
        $product->title = $request->title;
        $product->description = $request->description;
        $product->price = $request->price;

        if($product->save()){
            return redirect('/');
        }else{
            return view("products.edit",["product" => $product]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Product::destroy($id);
        return redirect('/productos')->with('info', 'Producto eliminado con exito');
    }
}
