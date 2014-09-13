cmd_argument = ARGV[0] 
mr_correct_files = Array.new
file_w_content = `grep -r #{cmd_argument} * | cut -f1 -d:`.split("\n").uniq! #file name contaning the word
filelist = `find . -iname "*.rb" -o -iname "*.erb" -o -iname "*.js" -o -iname "*.css" -o -iname "*.yml" -o -iname "*.html" -o -iname "*.txt"`.split("\n").sort! 
#--------------------------------------------------------------------
puts "Files with names that matches <" + cmd_argument + ">"
filelist.each {|file|
	if(file.include? cmd_argument)
    	puts "  " + file
    end
}
#--------------------------------------------------------------------

filelist.each do |mr_extensions|
	if(file_w_content != nil)
		file_w_content.each do |mr_found_words|
			if(mr_extensions.include? mr_found_words)
				mr_correct_files.push(mr_extensions)
			end
		end
	end
end
#-------------------------------------------------------------------
puts "**************************************************"
puts "Files with content that matches <" + cmd_argument + ">"
mr_correct_files.each do |mr_word| 
	if(File.readlines(mr_word).grep(/#{cmd_argument}/)) 
		puts mr_word
		words = `grep -nir #{cmd_argument} #{mr_word}`
		words = words.split("\n")
		words.each{ |final|
			puts "  " + final 
		}
		if( mr_word != mr_correct_files.last)
			puts "--------------------------------------------------"
		end
	end
end