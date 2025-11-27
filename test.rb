require './lib/CTF_Pal'
require 'colorize'
# get an array of all the current files and folders
before_filenames = Dir.glob("*")

ctf = CTFPal::Files.new
print("Enter filename>")
file = gets.chomp
unless file.empty?
	if File.exist?(file)
		ctf.file = file
	else 
		puts "\n\n\n\n\n#{file} does not exist.".red
		exit
	end
end

puts "Loaded file #{ctf.file}....\n\n".red


puts "FILE INFO: ".red + "#{ctf.get_file_info}\n\n\n"

puts "\n\n\n====Checking the strings====\n\n\n".red
ctf.find_flag_in_strings

#puts ctf.get_strings
#ctf.find_flag_custom(strings_name)

puts "\n\n\n====Checking the strings====\n\n\n".red


puts "\n\n\n====ExifTool=====\n\n\n".red
ctf.exiftool
puts "\n\n\n====ExifTool=====\n\n\n".red


puts "\n\n\n====BinWalk====\n\n\n".red
ctf.bin_walk
puts "\n\n\n====BinWalk====\n\n\n".red
# get the files and folders again
after_filenames = Dir.glob("*")

# this is where any new files or folders will be stored
new_files = []
after_filenames.each do |af|
	unless before_filenames.include?(af)
		new_files << af
	end
end

Dir.glob(File.join(new_files, "**")).each do |nf|
	ctf.file = nf
	#puts ctf.get_file_info
	ctf.detect_file.to_s.green
end