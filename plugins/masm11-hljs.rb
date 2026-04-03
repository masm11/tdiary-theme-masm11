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
      /* 2. Highlight.js 側の背景色指定を無効化し、日記の背景を透かす */
      .hljs {
        background: none !important;
        padding: 0 !important; /* 余計な余白もカット */
        filter: contrast(1.2); /* もし文字が少し薄ければコントラストを上げる */
      }
      /* 3. コード全体のフォント設定（お好みで） */
      pre code.hljs {
        display: block;
        overflow-x: auto;
        padding: 1em;
        color: #ddd; /* デフォルトの文字色を少し明るくしておく */
      }
    </style>
    <script>
      document.addEventListener('DOMContentLoaded', (event) => {
        hljs.highlightAll();
      });
    </script>
  EOT
end
