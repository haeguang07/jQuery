var APP_LOG_LIFECYCLE_EVENT = false;
let store = new Vue({
  el: '#app',
  data: {
    sitename: 'Vue.js 애완용품 샵',
    // product: {
    //   id: 1001,
    //   title:"고양이 사료, 25파운드",
    //   description: "당신의 고앵이를 위한 <em>거부할 수 없는</em>, 유기농 25파운드 사료입니다",
    //   price:20000,
    //   image:"images/product-fullsize.png",
    //   availableInventory: 5
    // },
    products:[],
    cart:[],
    showProduct:true,
    order:{
      firstName:'',
      lastName:'',
      address:'',
      city:'',
      zip:'',
      state:'',
      method:'자택 주소',
      business:'직장 주소',
      home:'자택 주소',
      gift:'선물로 보내시',
      sendGift:'선물로 보내기',
      dontSendGift:'선물로 보내지 않기'
    },
    states:{
      AL:'알라바마',
      AK:'알래스카',
      AR:'애리조나',
      CA:'캘리포니아',
      NV:'네바다'
    }
  },
  methods:{
    addToCart(aproduct){
      this.cart.push(aproduct.id);      
    },
    showCheckout(){
      this.showProduct= this.showProduct ? false:true;
    },
    submitForm(){

    },
    cartCount(id){
      let count  =0;
      for(let i=0;i<this.cart.length;i++){
        if(this.cart[i]==id){
          count++;
        }
      }
      return count;
    },
    canAddToCart(aproduct){
      return aproduct.availableInventory>this.cartCount(aproduct.id)
    },
    checkRating(n,aproduct){
      return aproduct.rating  >=n;
    }
  },
  computed:{
    cartItemCount: function(){
      return this.cart.length;
    },
    sortedProductsP(){
      return this.products.sort(function (p1, p2) {
         return p1.price-p2.price;
      })
    },
    sortedProductsN(){
      return this.products.sort(function (a, b) {
        if (a.title > b.title) return 1;
        else return -1;
      })
    } 
  },
  filters:{
    formatPrice: function(price){
      if(!parseInt(price)){return "";}
      if(price>99999){
        var priceString =(price/100).toFixed(2);
        console.log(priceString);
        var priceArray = priceString.split("").reverse();
        console.log(priceArray);
        var index =3;
        while(priceArray.length>index+3){
          priceArray.splice(index+3,0,",");
          index+=4;
        }
        return "$" + priceArray.reverse().join("");
      }else{
        return "$" +(price/100).toFixed(2);
      }
    }
  },
  beforeCreate: function () {
    if (APP_LOG_LIFECYCLE_EVENT) {
      console.log('beforeCreate hook');
    }
  },
  created: function () {
    if (APP_LOG_LIFECYCLE_EVENT) {
      console.log('created hook');

      // fetch('data.json')
      // .then(resolve=> resolve.json())
      // .then(result=> {
      //   console.log(result)
      //   store.sitename=result.sitename
      // })
      // .catch(err=> console.log(err))
    }
    axios.get('./products.json')
    .then(result => {
      console.log(result.data.products);
      this.products =result.data.products;
    })
  },
  beforeMount: function () {
    if (APP_LOG_LIFECYCLE_EVENT) {
      console.log('brforeMount hook');
    }
  },
  mounted: function () {
    if (APP_LOG_LIFECYCLE_EVENT) {
      console.log('mounted hook');
    }
  },
  beforeUpdate: function(){
    if (APP_LOG_LIFECYCLE_EVENT) {
      console.log('beforeUpdate hook');
    }
  },
  updated: function(){
    if (APP_LOG_LIFECYCLE_EVENT) {
      console.log('updated hook');
     // alert('updated');
    }
  },
  beforeDestroy: function(){
    if (APP_LOG_LIFECYCLE_EVENT) {
      console.log('beforeDestroy hook');
    }
  },
  destroyed: function(){
    if (APP_LOG_LIFECYCLE_EVENT) {
      console.log('destroyed hook');
    }
  }
});