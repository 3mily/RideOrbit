$(function(){
  $('.rocket').on('mouseover',function(){
    $('.red-badge').css('background-color', 'rgb(0,175,181)');
  });
  $('.nav').on('mouseleave', function(){
    $('.red-badge').css('background-color','orange');
  });
  $('#globe').on('mouseover',function(){
    $('.red-badge').css('background-color', 'orange');
  });
  $('#car').on('mouseover',function(){
    $('.red-badge').css('background-color', 'orange');
  });
  $('.dropdown').on('mouseover',function(){
    $('.red-badge').css('background-color', 'orange');
  });
})
