class ShiftOffset

  attr_reader :offset_letter,
              :offset_number

  def initialize(offset_letter, offset_number)
    @offset_letter = offset_letter
    @offset_number = offset_number
  end

end
