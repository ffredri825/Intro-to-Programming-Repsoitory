#Exercise5
#Why does the following code Give us the following error?

def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
from test.rb:5:in `<main>'


The method parameter block is missing the ampersand sign & 
that allows a block to be passed as a parameter.