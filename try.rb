#!/usr/bin/env ruby

IO.popen('ls') do |cmd_stdout_stream|
  # if the command has some output
  if cmd_stdout_stream.eof? == false
    # print every line in the commands output
    cmd_stdout_stream.each do |filename|
      puts 'file: ' + filename
    end
  end
end