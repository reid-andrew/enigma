require './lib/enigma.rb'

enigma = Enigma.new
source = File.open(ARGV[0], "r")
destination = File.open(ARGV[1], "w")
date = ARGV[3] ? ARGV[3] : Date.today
decrypted_message = enigma.decrypt(source.read, ARGV[2], date)

destination.write(decrypted_message[:decryption])
puts "Created '#{File.basename(destination)}' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
source.close
destination.close
