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
    calculate_shifts
    message_characters = split_characters(message)
    shift_characters(message_characters)

  end

  def convert_message(message)
    message.split(//)
  end

  def shift_characters(message_characters)
    counter = 0
    message_characters.map do |char|
      counter += 1
      find_shift(counter)

    end
  end

  def find_start_position(letter)
    @alphabet.alpha_by_letter[letter]
  end

  def find_shift_position(number)
    @alphabet.alpha_by_number[number]
  end

  def find_shift(counter)
    return :A if counter % 4 == 1
    return :B if counter % 4 == 2
    return :C if counter % 4 == 3
    :D
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

  def split_characters(message)
    message.split()
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
