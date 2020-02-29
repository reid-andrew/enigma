require 'date'
require './lib/alphabet.rb'
require './lib/key'
require './lib/offset.rb'
require './lib/encryptable.rb'

class Cryptography < Alphabet
  include Encryptable

  def encrypt(message, key = random_key, date = Date.today)
    encryption(true, message, key, date)
  end

  def decrypt(message, key, date = Date.today)
    encryption(false, message, key, date)
  end

end
