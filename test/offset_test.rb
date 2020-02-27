require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset.rb'

class ShiftOffsetTest < Minitest::Test

  def setup
    @offset1 = ShiftOffset.new("A", 1)
    @offset2 = ShiftOffset.new("C", 0)
  end

  def test_it_exists
    assert_instance_of ShiftOffset, @offset1
    assert_instance_of ShiftOffset, @offset2
  end

end
