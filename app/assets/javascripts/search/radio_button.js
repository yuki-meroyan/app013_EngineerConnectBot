$(function(){
  $( 'input[name="accessible-radio"]:radio' ).change( function() {
    var radioval = $(this).val();
    $("#search--box-beginner").css('display', 'none');
    $("#search--box-intermediate").css('display', 'none');
    $("#search--box-senior").css('display', 'none');

    if (radioval == "beginner"){
      $("#search--box-beginner").css('display', 'flex');
    }
    if (radioval == "intermediate"){
      $("#search--box-intermediate").css('display', 'flex');
    }
    if (radioval == "senior"){
      $("#search--box-senior").css('display', 'flex');
    }
  });
})