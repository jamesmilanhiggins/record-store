jQuery.fn.resetValOnClick = function() {
  this.click(function() {
   });
   return this;
}

$(document).ready(function() {
  $('.add-to-cart').resetValOnClick();
});
