document.addEventListener("turbolinks:load", function () {
$(function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#img_prev_0').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $('#user_image').change(function(){
        readURL(this);
    });
  });

  $(function() {

    function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
$('#img_prev_1').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
    }
}
$('#user_disability_passport').change(function(){
    readURL(this);
});
});


$(function() {

    function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
$('#img_prev_2').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
    }
}
$('#user_certificate').change(function(){
    readURL(this);
});
});
});
