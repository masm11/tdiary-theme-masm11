# <pre><code> の場合に
# javascript で <pre class="has-code"><code> に書き換える。
# css4 では :has(code) でできそうだけど、まだブラウザで未実装らしい。
add_header_proc do
  <<~EOT
    <script>
      $(function(){
        $('pre:has(code)').addClass('has-code');
      });
    </script>
    <script>
      $(function(){
        $('span.sanchor').text('⭕');
      });
      $(function(){
        $('span.canchor').text('➢');
      });
    </script>
  EOT
end

add_header_proc do
  <<~EOT
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@100..900&family=Noto+Sans+Mono:wght@100..900&display=swap" rel="stylesheet">
    <style>
      p {
        font-family: "Noto Sans JP", sans-serif;
        font-optical-sizing: auto;
        font-weight: 400;
        font-style: normal;
      }
      div.day div.body div.section code {
        font-family: "Noto Sans Mono", monospace;
        font-optical-sizing: auto;
        font-weight: 400;
        font-style: normal;
        font-variation-settings: "wdth" 100;
      }
    </style>
  EOT
end
# smartphone 用に文字列を短くする。
# PC でもこれでいい。
def navi_prev_diary(date); "前の日記"; end
def navi_next_diary(date); "次の日記"; end

class ::Object
  def untaint
    self
  end
end
