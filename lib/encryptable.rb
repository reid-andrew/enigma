module Encryptable

  def find_start_position(letter)
    @alphabet.alpha_by_letter[letter]
  end

  def find_shift_position(number)
    @alphabet.alpha_by_number[number]
  end

  def random_key
    rand(999999)
  end

  def pad_key(random_key)
    random_key = random_key.to_s
    while random_key.length < 5
      random_key.prepend("0")
    end
    random_key
  end

  def date_conversion(date)
    date.strftime("%m%d%Y")
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

  def calculate_shifts
    keys = Key.key_values
    offsets = ShiftOffset.offset_values
    @shifts = keys.reduce ({}) do |shift, (letter, number)|
      shift[letter] = number + offsets[letter]
      shift
    end
    @shifts
  end

  def shift_value(start, shift, encrypt)
    return 0 - ((start + shift) % 27) if !encrypt
    (start + shift) % 27
  end

  def shift_characters(message_characters, encrypt = true)
    counter = 0
    output = []
    message_characters.each do |char|
      counter += 1
      if !@alphabet.alphabet.include?(char)
        output << char
      else
        shift_value = shift_value(find_start_position(char), @shifts[find_shift(counter)], encrypt)
        char = find_shift_position(shift_value)
        char = " " if char.nil?
        output << char
      end
    end
    output
  end

  def encryption(message, key = random_key, date = Date.today, encrypt = true)
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
