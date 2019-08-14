# 曜日表記を簡略化。
add_title_proc do |date, title|
  title.sub(/\((Su|Mo|Tu|We|Th|Fr|Sa)[a-z]\)/, '(\1)')
end
