# pseudo code
# first iterate over each character of the text
# filter out/select only alphabetical characters
#  => case where there is a non-alphabetical character, use space
#  => if there is previously a space, do not add a space
# rejoin the text together

ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end

  clean_chars.join
end

p cleanup("---what's my +*& line?") == ' what s my line '