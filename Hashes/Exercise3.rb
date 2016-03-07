#Exercise3
# Using some of Ruby's built-in Hash methods, write a program that loops through a hash 
#and prints all of the keys. Then write a program that does the same thing except printing 
#the values. Finally, write a program that prints both.

person = {name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown'}

person.each do | k, v|
	puts "Key is #{k}"
end

person.each do | k, v|
	puts "Value is #{v}"
end

person.each do | k, v|
	puts "Key is #{k} and Value is #{v}"
end


opposites = {positive: "negative", up: "down", right: "left"}

opposites.each_key { |key| puts key }
opposites.each_value { |value| puts value }
opposites.each { |key, value| puts "The opposite of #{key} is #{value}" }
