require './test/test_helper.rb'
require './lib/alphabet.rb'

class AlphabetTest < Minitest::Test

  def test_it_has_an_alphabet
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, Alphabet.alphabet
  end

  def test_it_has_an_alphabet_by_letter
    assert_equal 3, Alphabet.alpha_by_letter["c"]
    assert_equal 6, Alphabet.alpha_by_letter["f"]
  end

  def test_it_has_an_alphabet_by_number
    assert_equal "c", Alphabet.alpha_by_number[3]
    assert_equal "f", Alphabet.alpha_by_number[6]
  end

end
