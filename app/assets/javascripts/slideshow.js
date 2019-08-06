$(function(){
  $('.slideshow__outer').each(function(){
    var $container = $(this),
        $slideGroup = $container.find('.slideshow__outer__stage'),
        $slides = $slideGroup.find('.slideshow__outer__stage__item'),
        $nav = $container.find('.slideshow-nav'),
        $dots = $('.slideshow-dots'),

        slideCount = $slides.length,
        currentIndex = 0,
        duration = 500,
        easing ='swing',
        interval = 4000,
        timer;
    
    $slides.each(function(i){
      $(this).css({left: 100 * i + '%'});
    });
    function goToSlide(index){
      if(currentIndex === slideCount -2){
        $slideGroup.animate({left: -100 * index + '%'},
        duration,easing,function(){
          $slideGroup.css({left: 0 + '%'}
          );
        })
        currentIndex = 0;
      }else{
        $slideGroup.animate({left: -100 * index + '%'},
        duration,easing)
        currentIndex = index;
      }
      updateNav();
    }

    function updateNav(){
      $dots.find('.slideshow-dot').css({
        background: "#fff"
      })
      $dots.find('.slideshow-dot').removeClass('active')
        .eq(currentIndex).addClass('active');
        $dots.find('.slideshow-dot').eq(currentIndex).css({
          background: "rgba(0,0,0,0.5)"
        })
    }

    function startTimer(){
      timer = setInterval(function(){
        var nextIndex = (currentIndex + 1) % slideCount;
        goToSlide(nextIndex);
      },interval);
    }

    function stopTimer(){
      clearInterval(timer);
    }

    $('.slideshow-nav__prev').on('click',function(event){
      event.preventDefault();
      if(currentIndex === 0){
        $slideGroup.css({left: -200 + '%'});
        currentIndex = 2;
      }else{
        goToSlide(currentIndex - 1);
      }
    });

    $('.slideshow-nav__next').on('click',function(event){
      event.preventDefault();
        goToSlide(currentIndex + 1);
    });
    
    $('.slideshow-dot').on('click',function(event){
      event.preventDefault();
      if (!$(this).hasClass('active')){
        goToSlide($(this).index());
      }
    });

    $container.on({
      mouseenter: stopTimer,
      mouseleave: startTimer
    });

    goToSlide(currentIndex);

    startTimer();
  });
});