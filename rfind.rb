cmd_argument = ARGV[0] 
found_file = IO.popen("find . -name " +cmd_argument+"*") # the dot means the current directroy
#--------------------the above is currently working-----------------------
line_number = IO.popen("grep -n " +cmd_argument + " * | cut -f2 -d:")
file_w_content = IO.popen('find . -type f -exec grep -l ' +cmd_argument+' {} \;')
found_word = IO.popen("grep " + cmd_argument + " * | cut -f2 -d:")
found_file = IO.popen("find . -name " +cmd_argument+"*")

workinprog = IO.popen("grep -ni " +cmd_argument)

word = found_word.to_enum
num = line_number.to_enum

#filelist = `find . -iname "*.rb" -o -iname "*.erb" -o -iname "*.js" -o -iname "*.css" -o -iname "*.yml" -o -iname "*.html" -o -iname "*.txt"`.split("\n").sort! 
#--------------------------------------------------------------------
puts "Files with names that matches <" + cmd_argument + ">"
found_file.each {|file|
    puts "  " + file
}
#--------------------------------------------------------------------

puts "**************************************************"
puts "Files with content that matches <" + cmd_argument + ">"

found_file.each{ |contaning_file|
    puts contaning_file
    puts "  " +  #grep -ni word_to_look_for file_to_look_in

}


# file_w_content.each{ |files|
#     if(workinprog =~ cmd_argument)
#         put files
#         workinprog = workinprog.split("\n")
#         workinprog.each { |w|
#             puts "  " + w
#         }
#         puts "--------------------------------------------------"
#     end
# }


# IO.popen('find . -type f -exec grep -l ' +cmd_argument+' {} \;') do |cmd_stdout_stream|
#     if cmd_stdout_stream.eof? == false
#         cmd_stdout_stream.each do |filename|
#             if(found_word != nil)
#                 puts filename
#                 puts "  #{num.next}:  #{word.next}".gsub("\n","")# gsub will remove new line   #"  "+ num.next + word.next
#             end
#         end
#     end
# end
#----------------------------------------------------------------------
# file_w_content do |file|
#     if(file.eof? == false)
#         puts "  "+ num.next + word.next
#         puts "--------------------------------------------------"
#     end
# end
# file_w_content.each {|file|
#     puts file
#     if(file.eof? == false)
        
#         puts "  "+ num.next + word.next

#         puts "--------------------------------------------------"
#     end
#     #line_number.each {|num|
    
#     #} #rfind
# } 
