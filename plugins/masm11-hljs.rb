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
      /* 日記の背景に馴染むように微調整 */
      .hljs {
        background: transparent !important; /* 背景を日記の背景色に合わせる */
        padding: 1em;
        line-height: 1.5;
        font-family: Consolas, Monaco, 'Andale Mono', 'Ubuntu Mono', monospace;
      }
    </style>
    <script>
      document.addEventListener('DOMContentLoaded', (event) => {
        hljs.highlightAll();
      });
    </script>
  EOT
end
