function item(){
  const price = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener("keyup", function() {
    let kakaku = price.value;
    if ( 300 <= kakaku && kakaku <= 9999999 ){
      let fee = Math.floor(kakaku /10);
      let gain = (kakaku - fee);
      tax.innerHTML = fee;
      profit.innerHTML = gain;
    }else{
      let fee = '-';
      let gain = '-';
      tax.innerHTML = fee;
      profit.innerHTML = gain;
    }
  })
;}


window.addEventListener("load", item);