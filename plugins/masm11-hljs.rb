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

  langs = %w(
    lisp
    erb
    groovy
    kotlin
    yaml
    rust
    autohotkey
    vim
    ini
    lua
    xml
    python
    ruby
  )

  lang_loader = langs.map{|lang|
    %Q[<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.11.1/languages/#{lang}.min.js"></script>]
  }.join("\n")

  # https://stackoverflow.com/questions/55860466/how-can-i-add-language-aliases-to-highlightjs
  alias_defs = [
    [ 'autohotkey', 'ahk' ]
  ].map do |d|
    orig = d[0]
    alias = d[1]
    <<~SNIPPET
      var lang = hljs.requireLanguage("#{orig}").rawDefinition();
      lang.aliases.concat(["#{alias}"]);
      hljs.registerLanguage("#{orig}", lang);
    SNIPPET
  end.join("\n")


  <<~EOT
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.11.1/styles/github-dark.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.11.1/highlight.min.js"></script>
    #{lang_loader}
    <script>
      document.addEventListener('DOMContentLoaded', (event) => {
        #{alias_defs}
        hljs.highlightAll();
      });
    </script>
  EOT
end
