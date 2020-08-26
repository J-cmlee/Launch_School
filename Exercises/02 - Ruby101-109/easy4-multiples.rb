# frozen_string_literal: true

def mutiples(limit)
  mutiple_list = []
  counter = 1
  while counter <= limit
    mutiple_list << counter if (counter % 5 == 0) || (counter % 3 == 0)
    counter += 1
  end
  mutiple_list
end

def multisum(limit)
  list = mutiples(limit)
  list.sum
end

def multisum2(limit)
  list = multiples(limit)
  list.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234_168
