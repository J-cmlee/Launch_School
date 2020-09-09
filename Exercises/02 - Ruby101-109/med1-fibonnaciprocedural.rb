

def fibonacci(n)
  return 1 if n <= 2
  value1 = 1
  value2 = 1
  sum = 0
  (n-2).times do
    sum = value1 + value2
    value1 = value2
    value2 = sum
  end
  sum
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501

def fibonacci2(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end


