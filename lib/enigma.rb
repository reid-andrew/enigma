require 'date'
require './lib/cryptography'
class Enigma < Cryptography

  def encrypt(message, key = random_key, date = Date.today)
    super
  end

  def decrypt(message, key = random_key, date = Date.today)
    super
  end

end
