
def add (a, b)
	a + b
end

def sub (a, b)
	a - b
end

def multiply(num1, num2)
	num1 * num2
end	
	
puts add(20, 45)
puts sub(80, 10)
puts multiply(add(20,45), sub(80,10))
puts add(sub(80, 10), multiply(sub(20, 6), add(30,5)))

