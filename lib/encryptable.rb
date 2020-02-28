module Encryptable

  def convert_message(message)
    message.downcase.split(//)
  end

  def find_shift(counter)
    return :A if counter % 4 == 1
    return :B if counter % 4 == 2
    return :C if counter % 4 == 3
    :D
  end

  def split_characters(message)
    message.split()
  end

  def date_conversion(date)
    date.strftime("%m%d%Y")
  end

  def random_key
    rand(999999)
  end

  def pad_key(random_key)
    random_key = random_key.to_s
    while random_key.length < 5
      random_key.prepend("0")
    end
    random_key
  end


end
