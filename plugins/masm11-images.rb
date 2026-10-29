    # misc/plugin/medium_zoom.rb
    add_footer_proc do
      <<-'HTML'
      <script src="https://unpkg.com/medium-zoom/dist/medium-zoom.min.js"></script>
      <script>
        document.addEventListener('DOMContentLoaded', function() {
          var imagePattern = /\.(jpe?g|png|gif|webp|svg)(\?.*)?$/i;
          var images = document.querySelectorAll('.section img, img.photo');
    
          images.forEach(function(img) {
            var link = img.closest('a');
            if (link) {
              var href = link.getAttribute('href');
              if (href && (imagePattern.test(href) || img.classList.contains('photo'))) {
                // 元画像のURLを data-zoom-src にセット
                img.setAttribute('data-zoom-src', href);

                // 元画像へのページ遷移を防ぐ
                link.addEventListener('click', function(e) {
                  e.preventDefault();
                });
              }
            }
          });

          // medium-zoom の初期化
          mediumZoom('.section img, img.photo', {
            background: 'rgba(0, 0, 0, 0.85)',
            margin: 24
          });
        });
      </script>
      HTML
    end
