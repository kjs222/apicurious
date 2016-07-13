// function openTab(evt, tabName) {
//     var i, x, buttons;
//     x = document.getElementsByClassName("tab");
//     for (i = 0; i < x.length; i++) {
//         x[i].style.display = "none";
//     }
//     buttons = document.getElementsByClassName("tab-button");
//     for (i = 0; i < x.length; i++) {
//         buttons[i].className = tablinks[i].className.replace("bold", "");
//     }
//     document.getElementById(tab).style.display = "block";
//     evt.currentTarget.className += " bold";
// }
// http://stackoverflow.com/questions/6967081/show-hide-multiple-divs-with-jquery

$(document).ready(function () {
  $('.tab').hide();

  $(function(){
        $('.showOne').click(function(){
              $('.tab').hide();
              $('#tab'+$(this).attr('target')).show();
        });
});

 //   function openTab(tabName) {
 //     $(".tabs").hide();
 //     $(tabName).show();
 //   }
 //
 //  $('#repos').on('click', function () {
 //    //  clearChart()
 //     openTab('#repos');
 //   });
 //   $('#my-activity').on('click', function () {
 //    //  clearChart()
 //     openTab('#my-activity');
 //   });
 //   $('#other-activity').on('click', function () {
 //    //  clearChart()
 //     openTab('#other-activity');
 //   });
 // });


});
