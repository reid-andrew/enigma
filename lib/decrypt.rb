require './lib/enigma.rb'

enigma = Enigma.new
source = File.open(ARGV[0], "r")
destination = File.open(ARGV[1], "w")
encrypted_message = enigma.decrypt(source.read, ARGV[2], ARGV[3])

destination.write(encrypted_message[:encryption])
puts "Created '#{File.basename(destination)}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
source.close
destination.close
