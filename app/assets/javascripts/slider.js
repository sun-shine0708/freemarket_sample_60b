$(function() {
  $('.top-banner-slider').slick({
      prevArrow:'<i class="slider-controller-left"></i>',
      nextArrow:'<i class="slider-controller-right"></i>',
      autoplay: true,
      autoplaySpeed: 4000,
      speed: 800
  });

  $('.top-banner-slider').on(function() {
    $('.top-banner-slider').slick('goTo', $(this).index());
  });
});



