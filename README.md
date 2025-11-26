# CTFPal

Performs a couple of test looking for low hanging flags. Stuff like `strings`, `binwalk`, `exif data`.

## Installation


## Usage
You will need to install the gem `colorize` for it to work.

`gem install colorize`

```ruby
require './lib/CTF_Pal'
require 'colorize'
ctf = CTFPal::Files.new
ctf.file = "challenge"
puts "Loaded file #{ctf.file}....\n\n".red


puts "FILE INFO: ".red + "#{ctf.get_file_info}\n\n\n"

puts "\n\n\n====Checking the strings====\n\n\n".red
ctf.find_flag_in_strings
ctf.find_flag_custom(strings_name)
puts "\n\n\n====Checking the strings====\n\n\n".red


puts "\n\n\n====ExifTool=====\n\n\n".red
ctf.exiftool
puts "\n\n\n====ExifTool=====\n\n\n".red


puts "\n\n\n====BinWalk====\n\n\n".red
ctf.bin_walk
puts "\n\n\n====BinWalk====\n\n\n".red
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/CTF_Pal.
