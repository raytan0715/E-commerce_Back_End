$(document).on('ready', function() {

      $('.pslide').slick({
        dots: true,
        infinite: true,
        speed: 300,/*速度*/
        // variableWidth: true,
        // autoplay: true,
        // autoplaySpeed: 5000,
        slidesToShow: 4,
        slidesToScroll: 2,
        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: 3,
              slidesToScroll: 1,
              infinite: true,
              dots: true
            }
          },
          {
            breakpoint: 600,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 1
            }
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          }
        ]
      });



    });
