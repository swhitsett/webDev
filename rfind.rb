cmd_argument = ARGV[0] 
file_w_content = `grep #{cmd_argument} * | cut -f1 -d:`.split("\n").uniq! #file name contaning the word
filelist = `find . -iname "*.rb" -o -iname "*.erb" -o -iname "*.js" -o -iname "*.css" -o -iname "*.yml" -o -iname "*.html" -o -iname "*.txt"`.split("\n").sort! 
#--------------------the above is currently working-----------------------
# line_number = IO.popen("grep -n " +cmd_argument + " * | cut -f2 -d:")
# file_w_content = IO.popen('find . -type f | grep -l ' +cmd_argument)
# found_word = IO.popen("grep " + cmd_argument + " * | cut -f2 -d:")
# found_file = IO.popen("find . -name " +cmd_argument+"*")

#--------------------------------------------------------------------
puts "Files with names that matches <" + cmd_argument + ">"
filelist.each {|file|
	if(file.include? cmd_argument)
    	puts "  " + file
    end
}
# rfind rfind
#--------------------------------------------------------------------

puts "**************************************************"
puts "Files with content that matches <" + cmd_argument + ">"
if(file_w_content != nil)
	file_w_content.each do |word|
		if(File.readlines(word).grep(/#{cmd_argument}/)) 
			puts word
			words = `grep -ni #{cmd_argument} #{word}`
			words = words.split("\n")
			words.each{ |word|
				puts "  " + word
			}
			puts "--------------------------------------------------"
		end
	end
end