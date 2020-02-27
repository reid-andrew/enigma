require 'date'
require './lib/alphabet.rb'
require './lib/key'
require './lib/offset.rb'

class Enigma

  attr_reader :alphabet

  def initialize
    @alphabet ||= Alphabet.new
  end

  def encrypt(message, key = random_key, date = Date.today)
    Key.create_keys(pad_key(key))
    ShiftOffset.create_offsets(date_conversion(date))

  end

  def calculate_shifts
    keys = Key.key_values
    offsets = ShiftOffset.offset_values
    shifts = keys.reduce ({}) do |shift, (letter, number)|
      shift[letter] = number + offsets[letter]
      shift
    end
    shifts
  end

  def date_conversion(date)
    date.strftime("%m%d%Y")
  end

  def random_key
    rand(999999)
  end

  def pad_key(rando_key)
    rando_key = rando_key.to_s
    while rando_key.length < 5
      rando_key.prepend("0")
    end
    rando_key
  end

end
