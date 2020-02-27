require 'date'
require './lib/alphabet'

class Enigma

  attr_reader :alphabet

  def initialize
    @alphabet ||= Alphabet.new
  end

  def encrypt(message, key, date = Date.today)
    date = date_conversion(date)
  end

  def date_conversion(date)
    date.strftime("%m%d%Y")
  end

  def random_key
    rand(999999)
  end

  def pad_key(rando_key)
    rando_key = rando_key.to_s
    while rando_key.length < 6
      rando_key.prepend("0")
    end
    rando_key
  end

end
