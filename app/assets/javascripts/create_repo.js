$(document).ready(function () {
  console.log("loaded")
  createRepo();
  console.log("finished")
});

function createRepo() {
      console.log("ready for click")
  $('#createRepo').on('click', '#submit-button', function() {
    console.log("got a click")
    name = $("#repo_name").val();
    userToken = $("#token").val();
    submitForm(name, userToken);
  });
}


function submitForm (name, userToken) {
  $.ajax({
   type: "POST",
   url: "https://api.github.com/user/repos",
   contentType: 'application/json',
   data: JSON.stringify({
       name:"test23"
   }),
   headers: {
    "Authorization": "Token c2165191e5ad925485b84da757b9239d79b95d12"
  },
   dataType: "json",
   success: function(data) {
     alert(data);
   }
 });
}
