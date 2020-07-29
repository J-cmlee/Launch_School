numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) # numbers is now [1, 3, 4, 5]
numbers.delete(1) # numbers is now [2, 3, 4, 5]

advice.gsub!('important', 'urgent')

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.assoc("Barney")
#=> ["Barney", 2]