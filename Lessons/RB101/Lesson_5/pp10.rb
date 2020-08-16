arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr_new = arr.map do |hashes|
  incremented_hash = {}
  hashes.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

p arr
p arr_new