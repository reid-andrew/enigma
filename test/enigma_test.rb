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

    @enigma.stubs(:rand).returns(123)
    @enigma.stubs(:shift_message).returns(['!', 's', 't', 'u', 'b', 's', '?'])

    expected = {
      encryption: "!stubs?",
      key: "00123",
      date: @enigma.convert_date(Date.today)
    }

    assert_equal expected, @enigma.encrypt("!stubs?")
  end

  def test_it_decrypts_messages
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_decrypts_messages_without_date
    encrypt = @enigma.encrypt("hello world", "02715")

    expected = {
      decryption: "hello world",
      key: "02715",
      date: @enigma.convert_date(Date.today)
    }

    assert_equal expected, @enigma.decrypt(encrypt[:encryption], "02715")
  end

end
