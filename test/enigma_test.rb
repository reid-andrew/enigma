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

  def test_it_encrypts_messages
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")

    @enigma.stubs(:random_key).returns(123)
    @enigma.stubs(:shift_characters).returns(['s', 't', 'u', 'b', 's'])

    expected2 = {
      encryption: "stubs",
      key: "00123",
      date: @enigma.date_conversion(Date.today)
    }

    assert_equal expected2, @enigma.encrypt("stubs")
  end

end
