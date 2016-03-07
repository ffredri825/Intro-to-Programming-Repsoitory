# next_loop.rb

i = 0
loop do
	i += 2
	if i ==4  # skip rest of the code in this iteration
		next
	end
	
	puts i
	if i ==10
		break  # this will cause execution to exit the loop
	end
end