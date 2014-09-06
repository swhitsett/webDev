#!/usr/bin/env ruby

cmd_argument = ARGV[0] 
search_4_word = "grep " + cmd_argument + " *"
line_number = "grep -n " +cmd_argument + " * |cut -f1 "
file_w_content = 'find . -type f -exec grep -l ' +cmd_argument+' {} \;'
# filelist = 'find . -iname "*.rb" -o -iname "*.erb" -o -iname "*.js" -o -iname "*.css" -o -iname "*.yml" -o -iname "*.html" -o -iname "*.txt"'

puts "Files with names that matches <" + cmd_argument + ">"
puts "**************************************************"
puts "Files with content that matches <" + cmd_argument + ">"
IO.popen(file_w_content) do |file|
  if (file.eof? == false)
        file.each do |item|
            puts item
            
            puts "--------------------------------------------------"
        end
    end
end


# IO.popen(search_4_word) do |terminal_output|
# 	if (terminal_output.eof? == false)
# 		terminal_output.each do |item|
# 			IO.popen(line_number) do |count|
# 				count.each do |num_out|
# 					puts num_out + item
# 				end
# 			end
# 		end
# 	end
# end


# NOTE;;;;;;;;;;;;;;;;;;;;;;;;;
# find . -type f -exec grep -l "do" {} \;
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


# #!/usr/bin/env ruby

# regex = ARGV[0]

# # If nothing is entered
# if regex == nil 
#     abort('Error: Blank or invalid pattern.') 
# end

# #Get file list from current dir and sort alphabetically
# filelist = `find . -iname "*.rb" -o -iname "*.erb" -o -iname "*.js" -o -iname "*.css" -o -iname "*.yml" -o -iname "*.html" -o -iname "*.txt"`.split("\n").sort! 


# print "Files with names that matches <" + regex + "> \n"

# # Check filelist for regex and prints matching filenames
# filelist.each { |f| if f.match(regex) 
#     puts "  " + f 
#     end 
# }

# puts "**************************************************"
# print "Files with content that matches <" + regex + ">\n"

# # Check files for content matching the regex
# filelist.each { |f| 
#     dump =  `grep -ni #{regex} #{f}`
#     if dump =~ /#{regex}/i
#         puts f 
#         dump = dump.split("\n")
#         dump.each { |d| puts "  " + d }
#         puts "--------------------------------------------------"
#     end 
# }