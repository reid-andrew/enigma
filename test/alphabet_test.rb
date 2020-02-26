require 'minitest/autorun'
require 'minitest/pride'
require './lib/alphabet.rb'

class AlphabetTest < Minitest::Test

  def setup
    @alpha = Alphabet.new
  end

  def test_it_exists
    assert_instance_of Alphabet, @alpha
  end

end
