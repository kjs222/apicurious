$(document).ready(function () {
  createRepo();

  $('#tabMyActivity').hide();
  $('#tabOtherActivity').hide();
  $('#tabOpenPR').hide();

  $(function(){
    $('.showOne').click(function(){
      $('.showOne').removeClass("active-panel")
      $(this).addClass("active-panel")
      $('.tab').hide();
      $('#tab'+$(this).attr('target')).show();
    });
  });
});
