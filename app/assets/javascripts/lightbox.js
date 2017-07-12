jQuery.fn.hideOnClick = function() {
  this.click(function() {
    $(this).css('display', 'none');
   });
   return this;
}

$(document).ready(function() {
  $('.lightbox').hideOnClick();
});
