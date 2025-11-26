require './lib/CTF_Pal'
require 'colorize'
ctf = CTFPal::Files.new
ctf.file = "challenge"
puts "Loaded file #{ctf.file}....\n\n".red


puts "FILE INFO: ".red + "#{ctf.get_file_info}\n\n\n"

puts "\n\n\n====Checking the strings====\n\n\n".red
ctf.find_flag_in_strings
puts "\n\n\n====Checking the strings====\n\n\n".red


puts "\n\n\n====ExifTool=====\n\n\n".red
ctf.exiftool
puts "\n\n\n====ExifTool=====\n\n\n".red


puts "\n\n\n====BinWalk====\n\n\n".red
ctf.bin_walk
puts "\n\n\n====BinWalk====\n\n\n".red