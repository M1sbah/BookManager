$(document).on('turbo:load', function() {
  setTimeout(function(){
 		$(".messages").hide(500)
 	},5000)
});


$(document).on('turbo:render', function() {
  setTimeout(function(){
    $(".messages").hide(500)
  },5000)
});


$(document).on('turbo:load',function(){
  function readURL(input){
    if(input.files && input.files[0]){
      var reader = new FileReader();
      reader.onload = function(e){
        // alert(e.target.result)
        $("#cover_prev").attr('src',e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#book_cover").change(function(){
      // $('#cover_prev').removeClass("cover-upload-image-tag");
      readURL(this);
    });
});
