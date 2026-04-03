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

  langs = [ 'lisp', 'erb', 'groovy', 'kotlin', 'yaml', 'rust', 'autohotkey', 'vim', 'ini', 'lua', 'xml', 'python', 'ruby' ]

  lang_loader = langs.map{|lang|
    %Q[<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.11.1/languages/#{lang}.min.js"></script>]
  }.join("\n")


  <<~EOT
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.11.1/styles/base16/monokai.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.11.1/highlight.min.js"></script>
    #{lang_loader}
    <style>
      /* 2. Highlight.js が持っている背景色を、より強力なセレクタで打ち消す */
      /* `pre code` に対して直接指定することで、ライブラリの `pre .hljs` よりも優先させる */
      pre > code.hljs {
        background: transparent !important; /* 日記の背景を透かす */
        background-color: transparent !important;
        border: none !important; /* もし枠線があれば消す */
        padding: 1.2em !important; /* 見やすい余白を作る */
        display: block !important;
        
        /* 3. フォントと文字の読みやすさを調整 */
        font-family: 'Consolas', 'Monaco', 'Courier New', monospace !important;
        font-size: 14px !important; /* お好みのサイズに */
        line-height: 1.6 !important; /* 行間を広くする */
        color: #ddd !important; /* ハイライトされない文字を少し明るく */
      }
    </style>
    <script>
      document.addEventListener('DOMContentLoaded', (event) => {
        hljs.highlightAll();
      });
    </script>
  EOT
end
