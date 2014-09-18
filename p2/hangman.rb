#!/usr/local/bin/ruby

# im sorry this code is so horrible.

num_of_attempts = 9
guess_array = Array.new
before_deletion = Array.new
honest_game_yet = false
mr_word = ""

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
#-------------------------------------------------------------------------
desired_word_length = Array.new(w_length.to_i,'_'.chomp) # WHY IS THERE ALWAYS NEWLINES IN AN ARRAY???
while(num_of_attempts != 0)		

	print "enter your guess: "
	cur_guess = gets.chomp
	print "\n"

	if (guess_array.include? cur_guess)
		puts "you already guessed " + cur_guess
		num_of_attempts = num_of_attempts + 1
	elsif (!(/[[:lower:]]/.match(cur_guess)))
		puts "only lowercase letters a-z are allowed"
		num_of_attempts = num_of_attempts + 1
	elsif ((/[[:alpha:]]/.match(cur_guess)) || honest_game_yet == false)
		if(swap_array.length != 0)
			tmp_array = swap_array.clone
		end
	
		swap_array.delete_if{ |i|
			i.include?(cur_guess)
		}
		guess_array.push(cur_guess)
	end

	if (swap_array.length == 0 || honest_game_yet == true)
		if(honest_game_yet == false)
			mr_word = tmp_array[rand(tmp_array.length)]
			puts mr_word
		end

		honest_game_yet = true   #location location location
		
		if(mr_word.include? cur_guess)
			desired_word_length[mr_word.index(cur_guess)] = cur_guess
			num_of_attempts = num_of_attempts + 1
		end
	end

	num_of_attempts = num_of_attempts - 1

	if (num_of_attempts <= 0)
		if(mr_word == "")
			mr_word = tmp_array[rand(tmp_array.length)]
		end
		puts "YOU LOOSE! The word was: "+mr_word
	elsif (!(desired_word_length.include? "_"))
		puts "YOU WIN!"
		num_of_attempts = 0
	elsif(num_of_attempts != 0)
	
		guess_array.each{|index| print index + " "}
		puts " (" + num_of_attempts.to_s + " chances left)"
		desired_word_length.each{|index| print index +" "}
		print "\n" + "\n"
	end
end


#---------------------------------------------------------------------------