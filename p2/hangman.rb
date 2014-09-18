#!/usr/local/bin/ruby

num_of_attempts = 10
guess_array = Array.new
# def start_fair_game(tmp_array)
# 	word = tmp_array[rand(tmp_array.length)]
# end

def cheat_function (swap_array, cur_guess)
	tmp_array = swap_array
	
	swap_array.delete_if{ |i|
		i.include?(cur_guess)
	}
	return tmp_array
end

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

#---------------------------------------------------------------------------
# this seems more pratical but wayyyy slower.
# dictionary.delete_if{|i|
# 	i.length != w_length.to_i
# }
# dictionary.compact
swap_array = Array.new
dictionary.each{|i|
	if(i.length == w_length.to_i)
		swap_array.push(i)
	end
}
dictionary = swap_array
#-------------------------------------------------------------------------
desired_word_length = Array.new(w_length.to_i,'_'.chomp) # WHY IS THERE ALWAYS NEWLINES IN AN ARRAY???
while(num_of_attempts != 0)		

	print "enter your guess: "
	cur_guess = gets.chomp
	print "\n"

	if((/[[:alpha:]]/.match(cur_guess)))
		mr_temp = cheat_function(swap_array, cur_guess)
		guess_array.push(cur_guess)
	end
	if (swap_array.length == 0)
		mr_word = mr_temp[rand(mr_temp.length)]
		desired_word_length[mr_word.index('y')] = cur_guess
	end

	guess_array.each{|index| print index + " "}
	puts " (" + num_of_attempts.to_s + " chances left)"
	desired_word_length.each{|index| print index +" "}
	print "\n" + "\n"
	num_of_attempts = num_of_attempts - 1
end
#---------------------------------------------------------------------------