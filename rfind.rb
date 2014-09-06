cmd_argument = ARGV[0] 
line_number = IO.popen("grep -n " +cmd_argument + " * | cut -f2 -d:")
file_w_content = IO.popen('find . -type f -exec grep -l ' +cmd_argument+' {} \;')
found_word = IO.popen("grep " + cmd_argument + " * | cut -f2 -d:")
found_file = IO.popen("find . -name " +cmd_argument+"*")

word = found_word.to_enum
num = line_number.to_enum

puts "Files with names that matches <" + cmd_argument + ">"
found_file.each {|file|
    puts "  " + file
}


puts "**************************************************"
puts "Files with content that matches <" + cmd_argument + ">"




IO.popen('find . -type f -exec grep -l ' +cmd_argument+' {} \;') do |cmd_stdout_stream|
    if cmd_stdout_stream.eof? == false
        cmd_stdout_stream.each do |filename|
            puts filename
                puts "  "+ num.next + word.next
        end
    end
end
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
