# frozen_string_literal: true
require "base64"
require 'shellwords'
require 'fileutils'

require_relative "CTF_Pal/version"

module CTFPal
  class Files
    attr_accessor :file

    def initialize
      @file = file
    end
    def file
      @file
    end
    def get_file_info
      cmd = "file #{Shellwords.escape(@file)}"
    `#{cmd}`
    end
    def get_strings
      command = "strings #{Shellwords.escape(@file)}"
    `#{command}`
    end
    def detect_file
      # this method will detect certain files types
      info = get_file_info
      if info.downcase.match("png")
        puts "Found a png file... copying it and renaming it..."
        FileUtils.cp(@file, "#{@file.split("/")[1]}_new.png")
      end
    end
    def find_flag_in_strings
      get_strings.split.each do |line|
        if line.downcase.match("ctf{")
            puts line
        elsif line.match("435446")
            puts line
        elsif line.match("Q1RGe")
            puts line
        end
      end
    end
    def find_flag_custom(strings_name)
      # 'strings' is the output of strings name
      strings = get_strings
      # 'strings_name' is the custom string 
      base64_strings = Base64.encode64(strings_name)
      hex_strings    = strings_name.unpack('H*').first
      strings.each do |line|
        if line.match(base64_strings)
            puts line
        elsif line.match(hex_strings)
            puts line
        elsif line.match(strings_name)
            puts line
        end
      end
    end
    def exiftool
      cmd = `exiftool  #{Shellwords.escape(@file)}`
      puts "#{cmd}"
    end
    def bin_walk
      cmd = `binwalk #{Shellwords.escape(@file)} -e`
      puts cmd
    end
  end
end
