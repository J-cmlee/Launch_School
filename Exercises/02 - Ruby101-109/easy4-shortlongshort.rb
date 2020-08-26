# frozen_string_literal: true

def short_long_short(str1, str2)
  long = ''
  short = if str1.length < str2.length
            long = str2
            str1
          else
            long = str1
            str2
          end
  short + long + short
end

p short_long_short('abc', 'defgh') == 'abcdefghabc'
p short_long_short('abcde', 'fgh') == 'fghabcdefgh'
p short_long_short('', 'xyz') == 'xyz'
