#conditional_loop.rb

x = 0

while x <= 10
	if x == 7
		x += 1
		break 
	elsif x.odd?
		puts x
	end
	x += 1
end

#i = 0

#loop do
#	i += 2
#	puts i
#	if i ==10
#		break  # this will cause execution to exit the loop
#	end
#end
