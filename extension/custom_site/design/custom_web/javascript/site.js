/* MAIN MENU */
var ww = document.body.clientWidth;

jQuery(document).ready(function() {
   "use strict";
   jQuery('body').find("#mainmenu li a").each(function() {
      if (jQuery(this).next().length > 0) {
         jQuery(this).addClass("parent");
      }
   });

   jQuery('body').find(".toggleMenu").click(function(e) {
      e.preventDefault();
      jQuery(this).toggleClass("active");
      jQuery('body').find("#mainmenu").toggle();
   });
   adjustMenu();
   /*
   jQuery('body').find(".toggleContentMenu").click(function(e) {
      e.preventDefault();
      jQuery(this).toggleClass("active");
      jQuery('body').find(".contentMobileFirst .contentMenu").toggle();
   });
   */
});

jQuery(window).load(function () {
   /*
   jQuery('body').find("#mainmenu").css('pointer-events', 'auto');
   jQuery('body').find(".contentMobileFirst .contentMenu").css('pointer-events', 'auto');
   */
   //jQuery('body').backstretch("/extension/echo_site_vfb/design/custom_web/images/pageback/bg-warten-3.jpg");
});

jQuery(window).bind('resize orientationchange', function() {
   "use strict";
   ww = document.body.clientWidth;
   adjustMenu();

});

var adjustMenu = function() {
   "use strict";
   if (ww < 801) {
      jQuery('body').find(".toggleMenu").css("display", "inline-block");
      if (!jQuery('body').find(".toggleMenu").hasClass("active")) {
         jQuery('body').find("#mainmenu").hide();
      } else {
         jQuery('body').find("#mainmenu").show();
      }
      /*
      jQuery('body').find("#mainmenu li").unbind('mouseenter mouseleave');
      jQuery('body').find("#mainmenu li a.parent").unbind('click').bind('click', function(e) {
         e.preventDefault();
         jQuery(this).parent("li").toggleClass("hover");
      });
      jQuery('body').find("#mainmenu li.active").addClass("hover");
      */
   }
   else if (ww >= 801) {
      jQuery('body').find(".toggleMenu").css("display", "none");
      jQuery('body').find("#mainmenu").show();
      /*
      jQuery('body').find("#mainmenu li").removeClass("hover");
      jQuery('body').find("#mainmenu li a").unbind('click');
      jQuery('body').find("#mainmenu li").unbind('mouseenter mouseleave').bind('mouseenter mouseleave', function() {
         jQuery(this).toggleClass('hover');
         jQuery(this).toggleClass('activelink');
         jQuery(this).find("ul").toggleClass('animatedfast');
         jQuery(this).find("ul").toggleClass('fadeInUp');
      });
      jQuery('body').find("#mainmenu ul li").unbind('mouseenter mouseleave').bind('mouseenter mouseleave', function() {
         jQuery(this).toggleClass('hover');
         jQuery(this).find("ul li").toggleClass('animatedfast');
         jQuery(this).find("ul li").toggleClass('fadeInLeft');
      });
      */
   }
};

/* BACK TO TOP BUTTON */

jQuery(document).ready(function() {
   var offset = 220;
   var duration = 500;
   jQuery(window).scroll(function() {
      if (jQuery(this).scrollTop() > offset) {
         jQuery('.back-to-top').fadeIn(duration);
      } else {
         jQuery('.back-to-top').fadeOut(duration);
      }
   });

   jQuery('.back-to-top').click(function(event) {
      event.preventDefault();
      jQuery('html, body').animate({scrollTop: 0}, duration);
      return false;
   });

   <!-- SPONSORS SLIDER -->
   /*
   jQuery('#sponsoren').bxSlider({
      slideWidth: 235,
      pager: false,
      minSlides: 2,
      maxSlides: 4,
      infiniteLoop: true,
      hideControlOnEnd: true,
      slideMargin: 10,
      randomStart:true
   });
   */
});

/////////////////* Info Boxes */////////////////////////

jQuery('body').find('.message-close').on("click", function () {
   jQuery(this).parent().fadeOut();
});

/* flexslider */

var ww;
var adjustSliderHeight = function(slider,start){
   ww = document.body.clientWidth;
   var slide,text;

   if (start) {
      slide = slider.slides[0];
   } else {
      // before - nextslide
      slide = slider.slides[(slider.count - slider.currentSlide) - 1];
   }

   if (ww < 800) {
      //adjust text
      text = jQuery(slide).find('.flex-title');
      //text.height(text.height() + (jQuery(slider).height() - jQuery(slide).height()))
   }else{
      //adjust images

      slideImg = jQuery(slider).find('img');
      slideImg.css({
         'height':jQuery(slider).height(),
         'width':'auto'
      });

   }
};

/* flexslider */
jQuery(window).load(function () {

   jQuery('#slider').flexslider({
      controlNav: false,
      animation: "fade",
      pauseOnHover: true,
      slideshowSpeed: 10000,
      animationLoop:true,
      randomize:true,
      smoothHeight:true,
      start: function (slider) {
         adjustSliderHeight(slider,true);
         $('.flexslider').removeClass('loading');
         if (ww > 800){
            textTimeout = window.setTimeout(function(){
               jQuery('.flex-title').animate({ opacity: 1}, 250);
            },10);
         }
      },
      before: function (slider) {
         adjustSliderHeight(slider,false);
         if (ww > 800) {
            jQuery('.flex-title').animate({ opacity: 0}, 250);
            if (typeof textTimeout != 'undefined') {
               clearTimeout(textTimeout);
            }

         }
      },
      after: function (slider) {
         if (ww > 800) {
            textTimeout = window.setTimeout(function(){
               jQuery('.flex-title').animate({ opacity: 1}, 250);
            },10);
         }
      }
   });

   /*
   jQuery('.flex-wrapper').find('.flex-direction-nav li a').animate({ opacity: 0 }, 0);
   jQuery('.flex-wrapper').hover(function () {
      jQuery(this).find('.flex-direction-nav li a:not(.flex-disabled)').animate({ opacity: 1 }, 300);

   }, function () {
      jQuery(this).find('.flex-direction-nav li a').animate({ opacity: 0 }, 300);
   });
   */
});

/*gallery isotope*/
var $container =  jQuery('.isotopeCont').imagesLoaded( function() {
   $container.isotope({
      // main isotope options
      itemSelector: 'figure',
      layoutMode: 'masonry',
      // options for cellsByRow layout mode
      cellsByRow: {
         columnWidth: 220,
         rowHeight: 200
      },
      // options for masonry layout mode
      masonry: {
         columnWidth: 225,
         gutter: 20
      }
   });
});
/*
var $sponsors =  jQuery('.isotopeContSponsors').imagesLoaded( function() {
    $sponsors.isotope({
      // main isotope options
      itemSelector: 'figure',
      layoutMode: 'fitRows',
      // options for cellsByRow layout mode
      cellsByRow: {
         columnWidth: 200,
         rowHeight: 200
      },
      // options for masonry layout mode
      masonry: {
         columnWidth: 200,
         gutter: 30
      }
   });
});
*/