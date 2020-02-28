require 'date'
require './lib/alphabet.rb'
require './lib/key'
require './lib/offset.rb'
require './lib/encryptable.rb'

class Cryptography
  include Encryptable

  attr_reader :alphabet

  def initialize
    @alphabet ||= Alphabet.new
  end

  def encrypt(message, key = random_key, date = Date.today)
    key = pad_key(key)
    Key.create_keys(key)
    date = date.class == Date ? date_conversion(date) : date
    ShiftOffset.create_offsets(date)
    calculate_shifts
    message_characters = convert_message(message)
    output = shift_characters(message_characters).join
    { encryption: output,
      key: key,
      date: date
    }
  end



  def shift_characters(message_characters)
    counter = 0
    output = []
    message_characters.each do |char|
      counter += 1
      if @alphabet.alphabet.include?(char)
        shift_value = find_start_position(char) + @shifts[find_shift(counter)]
        shift_value = shift_value % 27
        char = find_shift_position(shift_value)
        char = " " if char.nil?
        output << char
      else
        output << char
      end
    end
    output
  end

  def find_start_position(letter)
    @alphabet.alpha_by_letter[letter]
  end

  def find_shift_position(number)
    @alphabet.alpha_by_number[number]
  end

  def calculate_shifts
    keys = Key.key_values
    offsets = ShiftOffset.offset_values
    @shifts = keys.reduce ({}) do |shift, (letter, number)|
      shift[letter] = number + offsets[letter]
      shift
    end
    @shifts
  end

end
