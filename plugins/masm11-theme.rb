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

# smartphone 用に文字列を短くする。
# PC でもこれでいい。
def navi_prev_diary(date); "前の日記"; end
def navi_next_diary(date); "次の日記"; end

class ::String
  def untaint
    self
  end
end
