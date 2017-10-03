class Integer
  # define the basics of roman numerals (I, V, X, L, C, D, M)
  ROMANS = {M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1}

  def to_roman
    number = self
    # numbers = self.break_apart
    result = []
    ROMANS.each do |roman_letter, decimal|
      number_of_roman_letters = number / decimal
      result << roman_letter.to_s * number_of_roman_letters
      number -= number_of_roman_letters * decimal
    end
    # numbers.each do |number|
    #   next if number == 0
    #   result << convert_decimal_to_letter(number)
    # end
    result.join
  end
  
  # break down number by powers of 10 ie. (4956 -> 4000, 900, 50, 6)
  # def break_apart
  #   count = 0
  #   numbers = []
  #   self.digits.each do |number|
  #     numbers << number * (10 ** count)
  #     count += 1
  #   end
  #   numbers.reverse
  # end

  # def convert_decimal_to_letter(number)
  #   ROMANS.each do |roman, decimal|
  #     comparison_result = number <=> decimal
  #     case comparison_result
  #     when 0
  #       return roman.to_s
  #     when 1
  #       divisor, remainder = number.divmod(decimal)
  #       if remainder == 0
  #         return roman.to_s * divisor
  #       else
  #         return roman.to_s + convert_decimal_to_letter(remainder)
  #       end
  #     end
  #   end
  # end
end

p 4859.to_roman