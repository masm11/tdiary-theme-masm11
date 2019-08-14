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

  highlightjs_base = 'https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0'
  langs = [ 'lisp', 'erb', 'groovy', 'kotlin', 'yaml' ]		# 今のところは 'x86asm' はやめとこうか。要らない。

  lang_loader = langs.map{|lang|
    %Q[<script src="#{highlightjs_base}/languages/#{lang}.min.js"></script>]
  }.join("\n")

  <<~EOT
    <link rel="stylesheet" href="#{highlightjs_base}/styles/obsidian.min.css">
    <script src="#{highlightjs_base}/highlight.min.js"></script>
    #{lang_loader}
    <script>hljs.initHighlightingOnLoad();</script>
  EOT
end
