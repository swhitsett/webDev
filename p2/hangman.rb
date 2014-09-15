#!/usr/local/bin/ruby

# need to improt wordlist
# 

# create a functuon to remove words from this array.
dictionary =File.open("wordlist.txt").read.split("\n")
is_int = false
while(is_int == false)
	print "Enter word length between 5-20: "
	mr_input = gets
	if(Integer(mr_input) == false)
		mr_input = false
	elsif(mr_input.to_i >= 20)
		mr_input = 20
		is_int = true
	elsif (mr_input.to_i <= 5)
		mr_input = 5
		is_int = true
	end
end
		





puts mr_input 
print "enter your guess:"