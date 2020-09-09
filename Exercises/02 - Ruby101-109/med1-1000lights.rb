def lights(n)
  light_array = Array.new(n+1) {false}
  return_array = []
  counter1 = 1
  n.times do
    counter2 = counter1
    while counter2 < light_array.length
      light_array[counter2] = !light_array[counter2]
      counter2 += counter1
    end
    counter1 += 1
  end
  light_array.each_with_index do |ele, index|
    return_array << index if ele == true
  end
  return_array
end

p lights(5)
p lights(10)

# Launch School Solution
# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(1000)