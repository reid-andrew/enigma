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





end
