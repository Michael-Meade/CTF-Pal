require './lib/CTF_Pal'

=begin
ctf = CTFPal::Files.new
ctf.file = "20230308_182238.jpg"
ctf.wl = "/home/mike/rockyou.txt"
ctf.stegskeek
=end

f = CTFPal::Files.new
f.file = "my_secret_recipe"

f.ltrace