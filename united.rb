#!/usr/bin/env ruby

regex = ARGV[0]

# If nothing is entered
if regex == nil 
    abort('Error: Blank or invalid pattern.') 
end

#Get file list from current dir and sort alphabetically
filelist = `find . -iname "*.rb" -o -iname "*.erb" -o -iname "*.js" -o -iname "*.css" -o -iname "*.yml" -o -iname "*.html" -o -iname "*.txt"`.split("\n").sort! 


print "Files with names that matches <" + regex + "> \n"

# Check filelist for regex and prints matching filenames
filelist.each { |f| if f.match(regex) 
    puts "  " + f 
    end 
}

puts "**************************************************"
print "Files with content that matches <" + regex + ">\n"

# Check files for content matching the regex
filelist.each { |f| 
    dump =  `grep -ni #{regex} #{f}`
    if dump =~ /#{regex}/i
        puts f 
        dump = dump.split("\n")
        dump.each { |d| puts "  " + d }
        puts "--------------------------------------------------"
    end 
}