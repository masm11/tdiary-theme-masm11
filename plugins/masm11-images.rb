# syntax highlight
#
# どの言語が対応してて、どの言語が built-in かは、
# ↓ここを見ると書いてある。
# https://highlightjs.org/download/
# checkbox を ON にして Download すると、zip の中に highlight.pack.js があって、
# ON にしてあるもの全てがその中に含まれている。
# registerLanguage を検索すると、言語名が見える。
# それを langs に追加すると、たぶん追加できる。

add_header_proc do
  %Q[
    <script src="https://unpkg.com/medium-zoom/dist/medium-zoom.min.js"></script>
    <script>
      mediumZoom('img.zoomable', {
        background: 'rgba(0, 0, 0, 0.85)', // Xっぽい暗い背景
        margin: 24
      });
    </script>
  ]
end
