class Alphabet

  attr_reader :alphabet,
              :alpha_by_letter,
              :alpha_by_number

  def initialize
    @alphabet ||= create_alphabet
    @alpha_by_letter ||= create_alpha_by_letter
    @alpha_by_number ||= create_alpha_by_number
  end

  def create_alphabet
    ("a".."z").to_a << " "
  end

  def create_alpha_by_letter
    counter = 1
    @alphabet.reduce ({}) do |alpha_hash, letter|
      alpha_hash[letter] = counter
      counter += 1
      alpha_hash
    end
  end

  def create_alpha_by_number
    counter = 1
    @alphabet.reduce ({}) do |alpha_hash, letter|
      alpha_hash[counter] = letter
      counter += 1
      alpha_hash
    end
  end

end
