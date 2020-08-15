counter = 1
while counter <= 99
  puts counter
  counter += 2
end

1.upto(99) {|i| puts i if i.odd?}

100.times {|i| puts i if i.odd?}