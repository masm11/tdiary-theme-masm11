# coding: utf-8
# image-modal.rb
# version 0.1
# -pv-
#
# 名称:
# 画像モーダル
#
# 概要:
# 絵日記Plugin機能追加版の画像を、小さい画像をクリックで元サイズを表示し、
# 元サイズ画像をクリックしたら小さい画像に戻ります。
#
# 使う場所:
# プラグインを ON にするだけです。
#
# ライセンスについて:
# Copyright (c) 2026 Yuuki Harano <masmer4@yahoo.co.jp>
#
# You can redistribute it and/or modify it under GPL2.
#

add_footer_proc do
  <<-'HTML'
  <script src="https://unpkg.com/medium-zoom/dist/medium-zoom.min.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      var imagePattern = /\.(jpe?g|png|gif|webp|svg)(\?.*)?$/i;
      var images = document.querySelectorAll('.section img');

      images.forEach(function(img) {
        var link = img.closest('a');
        if (link) {
          var href = link.getAttribute('href');
          if (href && (imagePattern.test(href))) {
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
      mediumZoom('.section img', {
        background: 'rgba(0, 0, 0, 0.85)',
        margin: 24
      });
    });
      </script>
  HTML
end
