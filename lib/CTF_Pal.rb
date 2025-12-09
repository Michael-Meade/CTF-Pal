# frozen_string_literal: true
require "base64"
require 'shellwords'
require 'fileutils'
require 'net/http'
require 'uri'

require_relative "CTF_Pal/version"

module CTFPal
  class Web
    attr_accessor :site
    def initialize
      @site = site
    end
    def robots
      ["robots.txt", "security.txt", "ai-plugin.json", "/.well-known/",
        "ads.txt", "dnt-policy.txt", "host-meta.json", "host-meta", "keybase.txt",
        "statements.txt", "gpc.json", "agent-card.json"].each do |path|
        unless @site.include?("https://")
          uri = URI("https://" + File.join(@site, "#{path}"))
        else
          uri = URI(File.join(@site, "#{path}"))
        end
        response = Net::HTTP.get_response(uri)
        puts response.body if response.is_a?(Net::HTTPSuccess)
      end
    end
  end
  class Files
    attr_accessor :file, :wl

    def initialize
      @file = file
      @wl   = wl
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
    def apktool
      # makes sure that the inputted file is an apk. 
      if File.extname(@file).eql?("apk")
        cmd = `apktool d #{Shellwords.escape(@file)}`
        puts cmd
      else
        puts "Please use an APK file..."
      end
    end
    def stegseek
      unless @wl.nil?
        unless @file.nil?
          # -wl is the wordlist. This is needed.
          cmd = `stegseek #{Shellwords.escape(@file)} -wl #{@wl} `
          puts cmd
        else
          puts "Please give a file."
        end
      else
        puts "Please give a word list."
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
    def ltrace(input: nil)
      unless input.eql?(nil)
        cmd = `ltrace -s 500 ./#{Shellwords.escape(@file)} #{input}`
        puts cmd
      else
        cmd = `ltrace -s 500 ./#{Shellwords.escape(@file)}`
        puts cmd
      end
    end
  end
  class DetectHash
    attr_accessor :input

    def initialize
      @input = input
    end
    def detect_hash
      cmd = `hash-id -h #{Shellwords.escape(@input)}`
      puts cmd
    end
  end
end
