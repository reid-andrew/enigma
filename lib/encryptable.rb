module Encryptable

  def convert_message(message)
    message.downcase.split(//)
  end

  def find_shift(counter)
    return :A if counter % 4 == 1
    return :B if counter % 4 == 2
    return :C if counter % 4 == 3
    :D
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

  def pad_key(random_key)
    random_key = random_key.to_s
    while random_key.length < 5
      random_key.prepend("0")
    end
    random_key
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
