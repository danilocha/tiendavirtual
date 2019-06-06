<template>
<section>
    <material-transition-group tag="div" class="row">
        <products-card-component :key="product.id" v-bind:product="product" :data-index="index" v-for="(product,index) in products"></products-card-component>
    </material-transition-group>
</section>
    
</template>
<script>
    export default {
        data(){
            return{
                    name: 'Products Component',
                    products: [],
                    endpoint: "/productos"
            }
        },
        created(){
            this.fetchProducts();
        },
         methods: {
           fetchProducts(){
               axios.get(this.endpoint).then((response)=>{
                   console.log(response.data.data);
                   this.products = response.data.data;
               });
           }
           
        }
    }
   
</script>
