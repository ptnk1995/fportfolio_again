$(document).ready(function(){
  if ($('textarea').length > 0) {
    var data = $('.ckeditor');
    $.each(data, function(i) {
      CKEDITOR.replace(data[i].id)
    });
    CKEDITOR.config.height = 700;
    CKEDITOR.config.image_previewText = "Image Preview";
  }
});
