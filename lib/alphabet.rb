class Alphabet

  attr_reader :alphabet,
              :alpha_by_letter

  def initialize
    @alphabet ||= create_alphabet
    @alpha_by_letter ||= create_alpha_by_letter
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

end
