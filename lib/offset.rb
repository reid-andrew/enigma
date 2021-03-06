class ShiftOffset

  @@all_offsets = nil

  def self.create_offsets(date_input, letters = "ABCD")
    @@all_offsets = []
    counter = 1
    number = truncate_input(square_input(date_input))
    while counter < 5
      @@all_offsets << create_single_offset(letters, number, counter)
      counter += 1
    end
  end

  def self.square_input(date_input)
    date_input.to_i * date_input.to_i
  end

  def self.truncate_input(sqaured_input)
    sqaured_input.to_s[-4..-1].to_i
  end

  def self.create_single_offset(letters, number, counter)
    ShiftOffset.new(letters[counter - 1], number.to_s[counter - 5].to_i)
  end

  def self.all
    @@all_offsets
  end

  def self.offset_values
    @@all_offsets.reduce ({}) do |offset_values, offset|
      offset_values[offset.offset_letter.to_sym] = offset.offset_number
      offset_values
    end
  end

  attr_reader :offset_letter,
              :offset_number

  def initialize(offset_letter, offset_number)
    @offset_letter = offset_letter
    @offset_number = offset_number
  end

end
