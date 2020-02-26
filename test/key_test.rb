require 'minitest/autorun'
require 'minitest/pride'
require './lib/key.rb'

class KeyTest < Minitest::Test

  def setup
    @key1 = Key.new("A", "02")
    @key2 = Key.new("C", "79")
  end

  def test_it_creates_keys
    Key.create_keys("02715")

    assert_equal 4, Key.all.size
    assert_equal "02", Key.all[0].key_number
    assert_equal "A", Key.all[0].key_letter
    assert_equal "15", Key.all[-1].key_number
    assert_equal "D", Key.all[-1].key_letter
  end

  def test_it_exists
    assert_instance_of Key, @key1
    assert_instance_of Key, @key2
  end

  def test_it_has_attributes
    assert_equal "A", @key1.key_letter
    assert_equal "02", @key1.key_number
    assert_equal "C", @key2.key_letter
    assert_equal "79", @key2.key_number
  end

end
