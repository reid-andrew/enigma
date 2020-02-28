class Key

  @@all_keys = nil

  def self.create_keys(random_number)
    @@all_keys = []
    counter = 0
    letters = "ABCD"
    while counter < 4
      @@all_keys << create_single_key(letters, random_number, counter)
      counter += 1
    end
  end

  def self.create_single_key(letters, number, counter)
    Key.new(letters[counter], "#{number[counter]}#{number[counter + 1]}")
  end

  def self.all
    @@all_keys
  end

  def self.key_values
    @@all_keys.reduce ({}) do |key_values, key|
      key_values[key.key_letter.to_sym] = key.key_number.to_i
      key_values
    end
  end

  attr_reader :key_letter,
              :key_number

  def initialize(key_letter, key_number)
    @key_letter = key_letter
    @key_number = key_number
  end

end
