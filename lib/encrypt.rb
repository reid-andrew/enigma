require './lib/enigma.rb'

enigma = Enigma.new
source = File.open(ARGV[0], "r")
destination = File.open(ARGV[1], "w")
# require "pry"; binding.pry
encrypted_message = enigma.encrypt(source.read)
destination.write(encrypted_message)
source.close
destination.close
