$(function() {
  $('.mypage__nav__main-contents__tab-container__tabs li').click(function() {
    var index = $('.mypage__nav__main-contents__tab-container__tabs li').index(this);
    $('.mypage__nav__main-contents__tab-container__tabs li').removeClass('active');
    $(this).addClass('active');
    $('.mypage__nav__main-contents__tab-contents__item-lists li').removeClass('show').eq(index).addClass('show');
  });
  
  $('.mypage__nav__main-contents__bottom-container__tabs li').click(function() {
    var index = $('.mypage__nav__main-contents__bottom-container__tabs li').index(this);
    $('.mypage__nav__main-contents__bottom-container__tabs li').removeClass('active');
    $(this).addClass('active');
    $('.mypage__nav__main-contents__bottom-tabcontents__item-lists li').removeClass('show').eq(index).addClass('show');
  });
});
