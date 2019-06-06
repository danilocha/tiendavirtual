<template>
    <div>
        Cantidad
        <input type="number" name="amount" :id="this.product.id" value="1" style="width:50px;">
        <button @click="addToCart" class="btn btn-primary">{{message}}</button>
    </div>
</template>
<script>
export default {
    data(){
        return{
            message: 'Agragar al carrito',
            endpoint: '/in_shopping_carts'
        }
        
    },
    props:{
        product:{
            type: Object
        }
    },
    methods:{ 
        addToCart(){
            axios({
                method: 'POST',
                url: this.endpoint,
                data: {
                    product_id: this.product.id,
                    amount: this.amount = document.getElementById(this.product.id).value
                },
                headers:{
                    'Accept':'application/json',
                    'Content-Type':'application/json'
                }
            }).then(()=>{
                // this.amount = document.getElementById("amount").value;
                window.store.commit("increment");
            })
        }
    }
}
</script>

