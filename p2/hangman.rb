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
dictionary.each{|i|
	if(i.length == w_length)
		puts " wordL "+i.length + "enterdL "+w_length
		dictionary.delete(i) #use.compact! to remove nills
	end
}

while(num_of_attempts != 0)		
	print "enter your guess:"
	cur_guess = gets

	guess_array.push(cur_guess)


end
