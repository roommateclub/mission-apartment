$(document).on("page:change", function(){
  console.log($(window).height());
  $('.full-section').css("min-height", $(window).height());
  $('.content-wrapper').css("min-height", $(document).height() - $('.navbar').outerHeight() - $('.footer').outerHeight());
  $(window).resize(function(){
      $(".content-wrapper").css("min-height", $(window).height() - $('.navbar').outerHeight() - $('.footer').outerHeight());
  })
})