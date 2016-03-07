#Exercise1 Below we have given you an array and a number. Write a program that 
#checks to see if the number appears in the array.

arr = [1, 3, 5, 7, 9, 11]

number = 3 

puts arr.select {|num| num == 3}

arr.each do |num|
	if num == number
		puts "#{number} is in the array"
	end
end

if arr.include?(number)
	puts "#{number} is indeed in the array"
end