$(function(){

  updateAddItem();
  
  function updateAddItem(){
    var $newButton = $("#file_photo_field");
    var buttonWidth = (620 - 126 * $(".sell__form__box__image__ul__li").length) + "px";
    if ($(".sell__form__box__image__ul__li").length === 5){
      $newButton.hide();
    }else if ($(".sell__form__box__image__ul__li").length === 0) {
      $newButton.show();
      $newButton.css("margin-left", 0);
      $newButton.css("width", buttonWidth);
    }else{
      $newButton.show();
      $newButton.css("width", buttonWidth);
    }
  }
  
    $(document).on("click",".sell-form-delete",function(e){
    e.preventDefault();
    $(this).parent().parent().parent().remove();
    updateAddItem();
  })

  $('#file_photo_field > input').on('change', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".sell__form__box__image__ul");

    if(file.type.indexOf("image") < 0){
      return false;
    }

    reader.onload = (function() {
      return function(e) {

        var imageSrc =  e.target.result;
        var buildHTML =`<li class="sell__form__box__image__ul__li">
        <div class="sell__form__box__image__ul__li__content">
        <img class="sell-form-image" src="` + imageSrc + `">
        <div class="sell__form__box__image__ul__li__content__upload">
        <a class="sell-form-update" href="/">編集</a>
        <a class="sell-form-update sell-form-delete" href="/">削除</a>
        </div>
        </div>
        </li>`
        $preview.append(buildHTML);
        updateAddItem();
      };
    })(file);
    reader.readAsDataURL(file);
  });

});

