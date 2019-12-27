$(function(){
  $('#private-from').on('click', function() {
    $('.private-from-list').toggle("slow");
  });
  $('#private-to').on('click', function() {
    $('.private-to-list').toggle("slow");
  });

  // $('#return-button').on('click', function(){
  //   $('.private__message__return').show("slideDown");
  // });
})