require './test/test_helper.rb'
require './lib/alphabet.rb'
require './lib/cryptography.rb'
require './lib/key'
require './lib/offset.rb'

class CryptographyTest < Minitest::Test

  def setup
    @crypto = Cryptography.new
  end

  def test_it_exists
    assert_instance_of Cryptography, @crypto
  end

  def test_it_has_attributes
    assert_instance_of Alphabet, @crypto.alphabet
  end

  def test_it_finds_start_position
    assert_equal 1, @crypto.find_start_position('a')
    assert_equal 27, @crypto.find_start_position(' ')
  end

  def test_it_finds_shift_position
    assert_equal 'a', @crypto.find_shift_position(1)
    assert_equal ' ', @crypto.find_shift_position(27)
  end

  def test_it_creates_random_key
    @crypto.stubs(:rand).returns(1234)

    assert_equal 1234, @crypto.random_key

    @crypto.stubs(:rand).returns(987654)

    assert_equal 987654, @crypto.random_key
  end

  def test_it_pads_keys_with_leading_zeroes
    @crypto.stubs(:random_key).returns(1234)

    assert_equal "01234", @crypto.pad_key(@crypto.random_key)

    @crypto.stubs(:random_key).returns(987654)

    assert_equal "987654", @crypto.pad_key(@crypto.random_key)
  end

  def test_it_converts_dates_to_formatted_string
    Date.stubs(:today).returns(Date.parse('03-05-2020'))

    assert_equal "05032020", @crypto.date_conversion(Date.today)
  end

  def test_it_converts_message_into_array_of_individual_characters
    expected = ['h', 'e', 'l', 'l', 'o', ',', ' ', 'w', 'o', 'r', 'l', 'd']

    assert_equal expected, @crypto.convert_message('hello, WORLD')
  end

  def test_it_finds_abcd_shift
    assert_equal :A, @crypto.find_shift(1)
    assert_equal :A, @crypto.find_shift(5)
    assert_equal :C, @crypto.find_shift(3)
    assert_equal :C, @crypto.find_shift(11)
  end

  def test_it_calculates_shifts
    offset_test_values = {:A => 1, :B => 0, :C => 2, :D => 5}
    key_test_values = {:A => 2, :B => 27, :C => 71, :D => 15}
    ShiftOffset.stubs(:offset_values).returns(offset_test_values)
    Key.stubs(:key_values).returns(key_test_values)
    expected = {:A => 3, :B => 27, :C => 73, :D => 20}

    assert_equal expected, @crypto.calculate_shifts
  end

  def test_it_determines_shift_direction
    offset_test_values = {:A => 3, :B => 4, :C => 5, :D => 6}
    key_test_values = {:A => 0, :B => 0, :C => 0, :D => 0}
    ShiftOffset.stubs(:offset_values).returns(offset_test_values)
    Key.stubs(:key_values).returns(key_test_values)
    shifts = @crypto.calculate_shifts

    assert_equal 4, @crypto.shift_value(@crypto.find_start_position("a"), shifts[@crypto.find_shift(1)], true)
    assert_equal 10, @crypto.shift_value(@crypto.find_start_position("e"), shifts[@crypto.find_shift(3)], true)
    assert_equal (-4), @crypto.shift_value(@crypto.find_start_position("a"), shifts[@crypto.find_shift(1)], false)
    assert_equal (-10), @crypto.shift_value(@crypto.find_start_position("e"), shifts[@crypto.find_shift(3)], false)
  end

  def test_it_shifts_characters
    offset_test_values = {:A => 1, :B => 1, :C => 1, :D => 1}
    key_test_values = {:A => 0, :B => 1, :C => 2, :D => 3}
    ShiftOffset.stubs(:offset_values).returns(offset_test_values)
    Key.stubs(:key_values).returns(key_test_values)
    @crypto.calculate_shifts
    expected = ['b', 'd', 'f', 'h', '!', 'z', 'a', 'c', 'a', ' ']
    assert_equal expected, @crypto.shift_characters(['a', 'b', 'c', 'd', '!', 'x', 'y', 'z', ' ', 'y'])
  end

  def test_it_encrypts_messages
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @crypto.encrypt("hello world", "02715", "040895")

    @crypto.stubs(:random_key).returns(123)
    @crypto.stubs(:shift_characters).returns(['s', 't', 'u', 'b', 's'])

    expected2 = {
      encryption: "stubs",
      key: "00123",
      date: @crypto.date_conversion(Date.today)
    }

    assert_equal expected2, @crypto.encrypt("stubs")
  end



























end
