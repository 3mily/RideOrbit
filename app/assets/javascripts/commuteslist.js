$(function(){
  $("#commutes-type-toggle").on("click", function(){
    $("#passengers-commutes-list").toggleClass("hidden");
    $("#drivers-commutes-list").toggleClass("hidden");
  })
  $(".connected").on("click", function(){
    // $(this).toggleClass("hidden");
  })
})