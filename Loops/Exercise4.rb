# Exercise4 Write a method that counts down to zero using recursion.Exercise4

def countdown(num)
	if num <= 0
	  puts num
	else
		puts num
		countdown(num - 1)
	end
end

countdown(6)
countdown(20)
countdown(-3)

