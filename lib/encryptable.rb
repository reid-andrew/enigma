module Encryptable

  def find_start_position(letter)
    Alphabet.alpha_by_letter[letter]
  end

  def find_shift_position(number)
    Alphabet.alpha_by_number[number]
  end

  def random_key
    rand(999999)
  end

  def pad_key(key)
    key = key.to_s
    while key.length < 5
      key.prepend("0")
    end
    key
  end

  def convert_date(date)
    date.strftime("%m%d%y")
  end

  def convert_message(message)
    message.downcase.split(//)
  end

  def find_shift(counter)
    return :A if counter % 4 == 1
    return :B if counter % 4 == 2
    return :C if counter % 4 == 3
    :D
  end

  def calculate_shifts(keys = Key.key_values, offsets = ShiftOffset.offset_values)
    @shifts = keys.reduce ({}) do |shift, (letter, number)|
      shift[letter] = number + offsets[letter]
      shift
    end
    @shifts
  end

  def shift_value(start, shift, encrypt)
    return (start + shift) % 27 if encrypt
    (start - shift) % 27
  end

  def shift_message(message_characters, encrypt)
    counter = 0
    message_characters.map do |char|
      counter += 1
      shift_character(char, counter, encrypt)
    end
  end

  def shift_character(char, counter, encrypt)
    return char if !Alphabet.alphabet.include?(char)
    shift_value = shift_value(find_start_position(char), @shifts[find_shift(counter)], encrypt)
    find_shift_position(shift_value).nil? ? " " : find_shift_position(shift_value)
  end

  def encryption(encrypt, message, key = random_key, date = Date.today)
    key = pad_key(key)
    Key.create_keys(key)
    date = date.class == Date ? convert_date(date) : date
    ShiftOffset.create_offsets(date)
    calculate_shifts
    message_characters = convert_message(message)
    output = shift_message(message_characters, encrypt).join
    { encryption: output, key: key, date: date}
  end

end
