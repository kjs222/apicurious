$(document).ready(function () {
  $('#tabMyActivity').hide();
  $('#tabOtherActivity').hide();

  $(function(){
    $('.showOne').click(function(){
      $('.tab').hide();
      $('#tab'+$(this).attr('target')).show();
    });
  });

});
