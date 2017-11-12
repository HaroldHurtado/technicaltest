
$(document).ready(function() {
    console.log("ready")
    $('#btn_show_duplicate').click(function(){
        console.log("ready")
    });
});

$(document).on('ready page:load', function () {
  // you code here
  console.log("ready")
  $('#btn_show_duplicate').click(function(){
      console.log("ready")
  });
});

$(document).on('turbolinks:load', function() {
    console.log("ready")
    $('#btn_show_duplicate').click(function(){
        console.log("ready")
    });
})

document.addEventListener("turbolinks:load", function () {
    console.log("ready")
    $('#btn_show_duplicate').click(function(){
        console.log("ready")
    });
})
