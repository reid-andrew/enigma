class Key

  @@all_keys = nil

  def self.create_keys(random_number)
    @@all_keys = []
    counter = 0
    letters = "ABCD"
    while counter < 4
      @@all_keys << Key.new(letters[counter], "#{random_number[counter]}#{random_number[counter + 1]}")
      counter += 1
    end
  end

  def self.all
    @@all_keys
  end

  attr_reader :key_letter,
              :key_number

  def initialize(key_letter, key_number)
    @key_letter = key_letter
    @key_number = key_number
  end

end
