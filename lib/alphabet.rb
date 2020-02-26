class Alphabet

  attr_reader :alphabet

  def initialize
    @alphabet ||= create_alphabet
  end

  def create_alphabet
    ("a".."z").to_a << " "
  end

end
