require 'date'
require './lib/alphabet.rb'
require './lib/key'
require './lib/offset.rb'
require './lib/encryptable.rb'

class Cryptography < Alphabet
  include Encryptable

  def encrypt(message, key = random_key, date = Date.today)
    crypto = encryption(true, message, key, date)
    {encryption: crypto[0], key: crypto[1], date: crypto[2]}
  end

  def decrypt(message, key, date = Date.today)
    crypto = encryption(false, message, key, date)
    {decryption: crypto[0], key: crypto[1], date: crypto[2]}
  end

end
