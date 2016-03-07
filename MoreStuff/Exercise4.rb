#Exercise4

#Need to add .call to block to get it to print out
def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }