<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ProductInShoppingCart;
use Barryvdh\DomPDF\Facade as PDF;
use App\ShoppingCart;

class ProductInShoppingCartsController extends Controller
{
    public function __construct(){
        $this->middleware("shopping_cart");
    }
    public function store(Request $request){
        $in_shopping_cart = ProductInShoppingCart::create([
            'shopping_cart_id' => $request->shopping_cart->id,
            'product_id' => $request->product_id,
            'amount' =>$request->amount
        ]);
        if($in_shopping_cart){
            return redirect()->back();
        }

        return redirect()->back()->whitErrors(['product' => 'No se pudo agregar el producto']);
    }
    public function update(Request $request, $id) { 
        $product = ProductInShoppingCart::find($id);
        $product->amount = $request->amount;
        $product->save();
    }

    public function destroy($id) { 
        ProductInShoppingCart::destroy($id);
    }
    public function exportPdf(){
        // $carrito = ProductInShoppingCart::get();
        $pdf = PDF::loadView('shopping_cart.pdf');
        return $pdf->download('CotizacionMLRseguridad.pdf');
    }
    
}
