def staggered_case(text)
  new_text = ''
  do_upcase = true
  text.each_char do |char|
    if char =~ /[A-Za-z]/
      if do_upcase
        new_text << char.upcase
      else
        new_text << char.downcase
      end
      do_upcase = !do_upcase
    else
      new_text << char
    end
  end
  new_text
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'