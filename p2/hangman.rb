#!/usr/local/bin/ruby

# need to improt wordlist
# 

# create a functuon to remove words from this array.
# to choose a word from the dictionary 
num_of_attempts = 10
guess_array = Array.new

dictionary =File.open("wordlist.txt").read.split("\n")
is_int = false
while(is_int == false)
	print "Enter word length between 5-20: "
	w_length = gets
	if(/[[:alpha:]]/.match(w_length))
		is_int = false
	elsif(w_length.to_i >= 20) 
		w_length = 20
		is_int = true
	elsif (w_length.to_i <= 5)
		w_length = 5
		is_int = true
	elsif (w_length.to_i >= 5 && w_length.to_i <= 20)#/[5-20]/.match(w_length)
		is_int = true
	end
end
# this seems more pratical but wayyyy slower.
# dictionary.delete_if{|i|
# 	i.length != w_length.to_i
# }
# dictionary.compact
newArray = Array.new
dictionary.each{|i|
	if(i.length == w_length.to_i)
		newArray.push(i)
	end
}
dictionary = newArray

desired_word_length = Array.new(w_length.to_i,'_'.chomp) # WHY IS THERE ALWAYS NEWLINES IN AN ARRAY???
while(num_of_attempts != 0)		

	print "enter your guess: "
	cur_guess = gets
	print "\n"
	guess_array.push(cur_guess.chomp) 

	#-------------------reading and deleting the word from the array------------------
	# ?????????????why dosent this work?????????
	# dictionary.each{|i|
	# if(cur_guess.include? i)
	# 	dictionary.pop(i)
	# end
	# }
	# dictionary.compact
	#--------------------------------------------------------------------------------

	guess_array.each{|index| print index + " "}
	puts " (" + num_of_attempts.to_s + " chances left)"
	desired_word_length.each{|index| print index +" "}
	print "\n" + "\n"
	num_of_attempts = num_of_attempts - 1
end
