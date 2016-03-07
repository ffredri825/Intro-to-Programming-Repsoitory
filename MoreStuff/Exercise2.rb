#Exercise2

#Nothing is printed to the screen because the block is never activated with the .call method.
#The method returns a Proc object.

# Nothing is printed out

#Need to add .call to block to get it to print out
def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }