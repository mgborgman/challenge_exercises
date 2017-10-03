require 'pry'

class Luhn
  def initialize(number)
    @number = number
  end

  def addends
    result = []
    digits = @number.digits
    digits.each_with_index do |_, index|
      if index.odd?
        digits[index] *= 2
        digits[index] -= 9 if digits[index] >= 10
      end
    end
    digits.reverse
  end

  def addends_even_index
    result = []
    digits = @number.digits
    digits.each_with_index do |_, index|
      if index.even?
        digits[index] *= 2
        digits[index] -= 9 if digits[index] >= 10
      end
    end
    digits
  end

  def checksum
    digits = self.addends
    digits.reduce(:+)
  end

  def checksum_even
    digits = self.addends_even_index
    digits.reduce(:+)
  end

  def valid?
    return true if self.checksum % 10 == 0
    false
  end

  def self.create(number)
    luhn = Luhn.new(number)
    sum = luhn.checksum_even
    if sum % 10 == 0
      new_digit = 0
    else
      _, remainder = sum.divmod(10)
      new_digit = 10 - remainder
    end
    number = number.digits.unshift(new_digit)
    number.reverse.join.to_i
  end
end