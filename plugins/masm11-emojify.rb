require 'emot'

class String
  def emojify
    self.to_str.gsub(/:([a-zA-Z0-9_+-]+):/) do |match|
      emoji_alias = $1.downcase
      icon = Emot.icon(emoji_alias.to_sym)
      if icon
        icon
      else
        match
      end
    end
  end
end
