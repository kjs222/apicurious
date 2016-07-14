// $(document).ready(function () {
//   createRepo();
// });

function createRepo() {
  $('#createRepo').on('click', '#submit-button', function() {
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
       name: name
   }),
   headers: {
    "Authorization": "Token " + userToken
  },
   dataType: "json",
   success: function(data) {
     alert("Repo created successfully!");
   }
 });
}
