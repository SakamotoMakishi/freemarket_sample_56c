$(function(){

  $(".single").ready(function(){
    updateAddItem();
  });
  
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
    var files = e.target.files;
    for (var i = 0, file; file = files[i]; i++) {
      var reader = new FileReader(),
          $preview = $(".sell__form__box__image__ul");

      if(file.type.indexOf("image") < 0){
        return false;
      }

      reader.onload = (function() {
        return function(e) {

          var imageSrc =  e.target.result;
          var buildHTML =`<li class="sell__form__box__image__ul__li">
          <div class="sell__form__box__image__ul__li__content">
          <img class="sell-form-image" src="${ imageSrc }">
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
    }
  });



  function buildCategory(categories){
    if (categories[0].id < 13){
      num = "2";
    }else{
      num = "";
    }
    var loophtml = []
    $.each(categories,function(index,category){
      loophtml.push(`<option value=${category.id}>${category.name}</option>`);
    });
    var html = `<div class="select-wrap">
                <i class="fa fa-angle-down"></i>
                <div class="serlect-default">
                <select name="item[category_id${num}]" id="item_category_id${num}"><option value="">---</option>
                ${loophtml}
                </select>
                </div>
                </div>`
    return html;
  }

  $("#item_category_id1").on("change",function(){
    var data = {selected_num: $(this).val()};
    $.ajax({
      url: "/items/category_search2",
      type: "GET",
      data: data,
      dataType: 'json',
    })
    .done(function(data){
      if($("#item_category_id2").size){
      $("#item_category_id2").parent().parent().remove();
      };
      var html = buildCategory(data);
      $('.sell__group__box-category-category').append(html)
    })
    .fail(function(){
      alert('error');
    })
  })

  $(document).on("change","#item_category_id2",function(){
    var data = {selected_num: $("#item_category_id2").val()};
    $.ajax({
      url: "/items/category_search2",
      type: "GET",
      data: data,
      dataType: 'json',
    })
    .done(function(data){
      if($("#item_category_id").size){
        $("#item_category_id").parent().parent().remove();
        };
      var html = buildCategory(data);
      $('.sell__group__box-category-category').append(html)
    })
    .fail(function(){
      alert('error');
    })
  })
});

