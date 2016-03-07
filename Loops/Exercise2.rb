# Exercise2  Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP". Each loop can get info from the user.Exercise2


# perform_again.rb
x = ""

while x != "STOP" do
	puts "Type STOP to stop playing, How are you feeling?"
	ans = gets.chomp
	puts "Want me to ask again"
	x = gets.chomp
end


#loop do
#	puts "Do you want to do that again?"
#	answer = gets.chomp
#	if answer != 'Y'
#		break
#	end
#end