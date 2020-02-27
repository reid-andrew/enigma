require './test/test_helper.rb'
require './lib/alphabet.rb'
require './lib/enigma.rb'
require './lib/key'
require './lib/offset.rb'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    assert_instance_of Alphabet, @enigma.alphabet
  end

  def test_it_encrypts_messages
    skip
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @engima.encrypt("hello world", "02715", "040895")
  end

  def test_it_calculates_shifts
    offset_test_values = {:A => 1, :B => 0, :C => 2, :D => 5}
    key_test_values = {:A => 2, :B => 27, :C => 71, :D => 15}
    ShiftOffset.stubs(:offset_values).returns(offset_test_values)
    Key.stubs(:key_values).returns(key_test_values)
    expected = {:A => 3, :B => 27, :C => 73, :D => 20}

    assert_equal expected, @enigma.calculate_shifts
  end

  def test_it_converts_dates
    Date.stubs(:today).returns(Date.parse('03-05-2020'))

    assert_equal "05032020", @enigma.date_conversion(Date.today)
  end

  def test_it_creates_random_key
    @enigma.stubs(:rand).returns(1234)

    assert_equal 1234, @enigma.random_key

    @enigma.stubs(:rand).returns(987654)

    assert_equal 987654, @enigma.random_key
  end

  def test_it_adds_leading_zeroes_to_random_keys
    @enigma.stubs(:random_key).returns(1234)

    assert_equal "01234", @enigma.pad_key(@enigma.random_key)

    @enigma.stubs(:random_key).returns(987654)

    assert_equal "987654", @enigma.pad_key(@enigma.random_key)
  end

end
