#!/usr/local/bin/ruby

num_of_attempts = 9
guess_array = Array.new
tmp_array = []
before_deletion = Array.new

# def cheat_function (swap_array, cur_guess)
# 	tmp_array = swap_array.clone
	
# 	swap_array.delete_if{ |i|
# 		i.include?(cur_guess)
# 	}
# 	#return tmp_array
# end

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
# delete_if seems more pratical but is slower
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

	if (guess_array.include? cur_guess)
		puts "you already guessed " + cur_guess
	elsif (!(/[[:lower:]]/.match(cur_guess)))
		puts "only lowercase letters a-z are allowed"
	elsif((/[[:alpha:]]/.match(cur_guess)))
		tmp_array = swap_array.clone
	
		swap_array.delete_if{ |i|
			i.include?(cur_guess)
		}
		guess_array.push(cur_guess)
		num_of_attempts = num_of_attempts - 1
	end
	
	if (swap_array.length == 0)
		mr_word = tmp_array[rand(tmp_array.length)]
		desired_word_length[mr_word.index(cur_guess)] = cur_guess
	end

	guess_array.each{|index| print index + " "}
	puts " (" + num_of_attempts.to_s + " chances left)"
	desired_word_length.each{|index| print index +" "}
	print "\n" + "\n"
end
#---------------------------------------------------------------------------