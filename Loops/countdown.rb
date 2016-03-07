# countdown.rb

x = gets.chomp.to_i

while x >= 0
	puts x
	x -= 1		# <-- Refactored this line
end

puts "Done"