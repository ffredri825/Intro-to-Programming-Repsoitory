# Exercise2 Look at Ruby's merge method. Notice that it has two versions. What is the difference between merge and merge!? 
# Write a program that uses both and illustrate the differences.

#The difference is merge! modifies permanently, while merge does not.

hash1 = {a: 100, b: 200}
hash2 = {b: 254, c: 300}
puts "Hash1 and Hash2 after merge()"
puts hash1.merge(hash2)
puts hash1
puts hash2


hash1 = {a: 100, b: 200}
hash2 = {b: 254, c: 300}

puts "Hash1 and Hash2 after merge!()"
puts hash1.merge!(hash2)
puts hash1
puts hash2

cat = {name: "whiskers"}
weight = {weight: "10 lbs"}
puts cat.merge(weight)
puts cat                  # => {:name=>"whiskers"}
puts weight               # => {:weight=>"10 lbs"}
puts cat.merge!(weight)
puts cat                  # => {:name=>"whiskers", :weight=>"10 lbs"}
puts weight               # => {:weight=>"10 lbs"}