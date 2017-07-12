jQuery.fn.hideOnClick = function() {
  this.click(function() {
    $(this).css('display', 'none');
   });
   return this;
}

$(document).on('turbolinks:load', function() {
  $('.lightbox').hideOnClick();
});

$(document).ready(function() {
  $('.lightbox').hideOnClick();
});
