def count_occurrences(vehicles)
  vehicles_hash = Hash.new(0)
  vehicles.each {|unit| vehicles_hash[unit] += 1}
  vehicles_hash.each {|key, value| puts "#{key} => #{value}"}
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)