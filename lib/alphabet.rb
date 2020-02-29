class Alphabet

  def self.alphabet
    @@alphabet ||= ("a".."z").to_a << " "
  end

  def self.alpha_by_letter
    counter = 1
    @@alpha_by_letter ||= Alphabet.alphabet.reduce ({}) do |alpha_hash, letter|
      alpha_hash[letter] = counter
      counter += 1
      alpha_hash
    end
  end

  def self.alpha_by_number
    counter = 1
    @@alpha_by_number ||= Alphabet.alphabet.reduce ({}) do |alpha_hash, letter|
      alpha_hash[counter] = letter
      counter += 1
      alpha_hash
    end
  end

end
