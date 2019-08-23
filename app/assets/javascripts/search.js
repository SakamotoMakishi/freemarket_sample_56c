$(function() {
  var search_list = $(".search-container__right__contents__title__box.js-lazy-load-images");
  function appendProduct(item) {
    var html = `<div class="search-container__right__contents__title__box__item">
                  <a href="/items/${item.id}"><div class="search-container__right__contents__title__box__item__image">
                    <img class="item-image" src="${item.images}">
                    </div>
                      <div class="search-container__right__contents__title__box__item__text">
                        <div class="search-container__right__contents__title__box__item__text__name">${item.name}</div>
                          <div class="search-container__right__contents__title__box__item__text__price">$${item.price}</div>
                          <div class="search-container__right__contents__title__box__item__text__icon">
                            <i class="far fa-heart">
                              <span>3</span>
                            </i>
                        </div>
                    </div>
                  </a>
                </div>`
    search_list.append(html);
  }
  $(".search__query").on("keyup", function() {
    var input = $(".search__query").val();
    $.ajax({
      type: 'GET',
      url: '/items/search',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(items) {
      $(".search-container__right__contents__title__box.js-lazy-load-images").empty();
      if (items.length !== 0) {
        if(input.length !== 0) {
            items.forEach(function(items){
              appendProduct(items);
            });                
        };
      }
    })
    .fail(function() {
      alert('検索に失敗しました');
    })
  });
});
$(function(){
  function buildHTML(comment){
    var comment_text = comment.text ? `${comment.text}` : "";
    var html = `
    <div class="comment__message__mycome">
    <div class="comment__message__mycome__user-avatar1">
    <img class="comment__message__mycome__user-avatar1" src="${comment.user_avatar}">
    </div>
    <div class="comment__message__mycome__name">
    ${comment.user_name}
    <div class="comment__message__mycome__name__san">
    ◤
    </div>
    </div>
    <div class="comment__message__mycome__text">
    ${comment_text}
    </div>
    </div>`
    return html;
  }
  $('#new_comment').on('submit',function(e){
    e.preventDefault();
    var comment = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: comment,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comment__message').append(html)
      $('#new_comment')[0].reset(); 
      return false
    })
    .fail(function(){
      alert('コメントを入力してください');
    })
    .always(function(){
      $('.submit').prop('disabled', false);
    })
  });
});
