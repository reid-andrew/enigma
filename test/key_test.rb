require './test/test_helper.rb'
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

  def test_it_creates_single_key
    key1 = Key.create_single_key("ABCD", "02715", 0)

    assert_equal "02", key1.key_number
    assert_equal "A", key1.key_letter

    key2 = Key.create_single_key("ABCD", "02715", 3)

    assert_equal "15", key2.key_number
    assert_equal "D", key2.key_letter
  end

  def test_it_creates_key_hash
    Key.create_keys("02715")
    expected = {:A => 2, :B => 27, :C => 71, :D => 15}

    assert_equal expected, Key.key_values
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
