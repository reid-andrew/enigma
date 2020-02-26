class Key

  @@all_keys = nil

  def self.create_keys(random_number)
    @@all_keys = []
    counter = 0
    while counter < 4
      @@all_keys << Key.new("#{random_number[counter]}#{random_number[counter + 1]}")
      counter += 1
    end
  end  

  def self.all
    @@all_keys
  end

  attr_reader :random_number

  def initialize(random_number)
    @random_number = random_number
  end

end
