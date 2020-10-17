def sequence(count, multiple)
  seq = []
  return [] if count == 0
  1.upto(count) {|index| seq << index*multiple}
  seq
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

def sequence2(count, first)
  (1..count).map { |value| value * first }
end