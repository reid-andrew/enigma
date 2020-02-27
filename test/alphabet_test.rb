require './test/test_helper.rb'
require './lib/alphabet.rb'

class AlphabetTest < Minitest::Test

  def setup
    @alpha = Alphabet.new
  end

  def test_it_exists
    assert_instance_of Alphabet, @alpha
  end

  def test_it_has_attributes
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @alpha.alphabet
  end

  def test_it_creates_alphabet
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @alpha.create_alphabet
  end

  def test_it_creates_alphabet_by_letter
    assert_equal 3, @alpha.alpha_by_letter["c"]
    assert_equal 6, @alpha.alpha_by_letter["f"]
  end

  def test_it_creates_alphabet_by_number
    assert_equal "c", @alpha.alpha_by_number[3]
    assert_equal "f", @alpha.alpha_by_number[6]
  end

end
