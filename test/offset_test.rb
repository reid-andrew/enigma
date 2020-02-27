require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset.rb'

class ShiftOffsetTest < Minitest::Test

  def setup
    @offset1 = ShiftOffset.new("A", 1)
    @offset2 = ShiftOffset.new("C", 0)
  end

  def test_it_creates_offsets
    ShiftOffset.create_offsets("040895")

    assert_equal 4, ShiftOffset.all.size
    assert_equal 1, ShiftOffset.all[0].offset_number
    assert_equal "A", ShiftOffset.all[0].offset_letter
    assert_equal 5, ShiftOffset.all[-1].offset_number
    assert_equal "D", ShiftOffset.all[-1].offset_letter
  end

  def test_it_squares_input
    assert_equal 1672401025, ShiftOffset.square_input("040895")
  end

  def test_it_truncates_input
    assert_equal 1025, ShiftOffset.truncate_input(1672401025)
  end

  def test_it_creates_single_offset
    key1 = ShiftOffset.create_single_offset("ABCD", 1025, 1)

    assert_equal 1, key1.offset_number
    assert_equal "A", key1.offset_letter

    key2 = ShiftOffset.create_single_offset("ABCD", 1025, 4)

    assert_equal 5, key2.offset_number
    assert_equal "D", key2.offset_letter
  end

  def test_it_exists
    assert_instance_of ShiftOffset, @offset1
    assert_instance_of ShiftOffset, @offset2
  end

end
