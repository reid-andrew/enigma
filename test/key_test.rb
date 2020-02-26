require 'minitest/autorun'
require 'minitest/pride'
require './lib/key.rb'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new("02")
  end

  def test_it_creates_keys
    Key.create_keys("02715")

    assert_equal 4, Key.all.size
    assert_equal "02", Key.all[0].random_number
    assert_equal "15", Key.all[-1].random_number
    require "pry"; binding.pry
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_has_attributes
    assert_equal "02", @key.random_number
  end

end
