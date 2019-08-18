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
  function appendErrMsgToHTML(msg) {
    var html = `<div class="search-container__right__contents__title__box__item">
                ${msg}
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
        items.forEach(function(items){
          appendProduct(items);
        });
      }
      else {
        appendErrMsgToHTML("一致する商品はありません");
      }
    })
    .fail(function() {
      alert('検索に失敗しました');
    })
  });
});