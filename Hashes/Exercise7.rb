#Exercise7 Given the following code...What's the difference between the two hashes that were created?

x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}

#The first hash that was created used a symbol x as the key. 
The second hash used the string value of the x variable as the key.

puts my_hash  # {:x=>"some value"}
puts my_hash2  #{"hi there"=>"some value"}