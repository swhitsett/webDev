a = ARGV[0] 
  puts a 
#end 
IO.popen('grep a *') do |cmd_stdout_stream|
  if cmd_stdout_stream.eof? == false	  # if the command has some output
    cmd_stdout_stream.each do |filename|  # print every line in the commands output
      puts 'file: ' + filename
    end
  end
end

