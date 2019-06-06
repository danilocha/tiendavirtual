<template>
    <div>
        <material-transition-group tag="div">
            <article class="card-product" :key="product.idPivot" :data-index="index" v-for="(product,index) in products">
                <div class="row">
                    <div class="col-2">
                      <a href="#" class="btn btn-danger" v-on:click.prevent="deleteteProduct(product)">Eliminar</a>
                     <!-- <form action="/in_shopping_carts/1" method="POST">
                        <input name="_method" type="hidden" value="DELETE">
                        <input type="submit" name="" value="Eliminar" class="btn btn-link red-text no-padding no-margin no-transform">
                    </form> -->
                    </div>
                    <div class="col-4">
                        <strong> {{product.title}} </strong>
                    </div>
                    <div class="col-2">
                            {{product.numbrePrice}}
                    </div>
                    <div class="col-2">
                       
                        <input v-on:keyup.enter.prevent="updateProduct(product)" :id="product.idPivot" :value="product.amount" name="amount" type="number" style="width:50px;" >  
                        
                    </div>
                    <div class="col-2">
                            {{product.total}}
                    </div>
                </div>
            </article>
            
        </material-transition-group>
        <article class="total card-product">
                <div class="row">
                    <div class="col-2">

                    </div>
                    <div class="col-8">
                        <strong> Total </strong>
                    </div>
                    <div class="col-2">
                            {{total}}
                    </div>
                </div>
            </article>


            <!-- inicia el modal -->
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
                Descarga tu cotizacion
            </button>   
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ingresa tus datos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" method="POST" v-on:submit.prevent="crearCotizacion" id="cotizacion">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email {{email}} </label>
                        <input v-model="email"  type="email" class="form-control" id="" placeholder="Escribe tu correo">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Telefono {{telefono}} </label>
                        <input v-model="telefono" type="number" class="form-control" id="" placeholder="Escribe tu numero de telefono">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Nombre {{nombre}} </label>
                        <input v-model="nombre" type="texto" class="form-control" id="" placeholder="Escribe tu nombre">
                    </div>
                    <input type="submit" value="descargar">
                </form>
                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" v-on:click.prevent="crearCotizacion()">Descargar</button>
            </div>
            </div>
        </div>
        </div>
    </div>
    
</template>
<script>
$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
export default {
    data(){
        return{
            endpoint: '/carrito/productos',
            products: [],
            fillProduct: {'id': '', 'amount': ''},
            email: '',
            telefono: '',
            nombre: '',
        }
    },
    created(){
        this.fetchProducts();
    },
    computed:{
        total(){
            let cents = this.products.reduce((acumulator,currentObj)=>{
                return acumulator + currentObj.total
            },0);
            return `$${cents}`;
        }
    },
    methods: {
        fetchProducts(){
            axios.get(this.endpoint).then(response=>{
                this.products = response.data.data;
                console.log(this.products);
            })
        },
        deleteteProduct: function(product){
            var url = 'in_shopping_carts/' + product.idPivot;
            axios.delete(url).then(response => {
               this.fetchProducts();
            });
        },
        // editProduct: function(product){
        //     
            
        // },
        updateProduct: function(product){
            this.fillProduct.id = product.idPivot;
            this.fillProduct.amount = document.getElementById(product.idPivot).value;
            var url = 'in_shopping_carts/' + this.fillProduct.id;
            axios.put(url, this.fillProduct).then(response => {
              this.fetchProducts();
            });
        },
         //Crear cotizacion 
            crearCotizacion: function(){
            var url = 'cotizaciones';
            axios.post(url, {
                nombre: this.nombre, 
                email: this.email, 
                telefono: this.telefono
                }).then(response=>{
                this.fetchProducts;
                // console.log(this.cotizacion);
            });
        }
    }
}
// var app = new Vue({
//   el: '#cotizacion',
//   data: {
//     nombre: '',
//     telefono: '',
//     regs: []
//     },
//   methods: {
 
//     crearCotizacion: function(product){
//             this.fillProduct.id = product.idPivot;
//             this.fillProduct.amount = document.getElementById(product.idPivot).value;
//             var url = 'in_shopping_carts/' + this.fillProduct.id;
//             axios.put(url, this.fillProduct).then(response => {
//               this.fetchProducts();
//             });
//         },
 
//     },
  
// });
</script>
