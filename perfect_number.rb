class PerfectNumber

  def self.classify(number)
    raise RuntimeError if number < 0
    @@number = number
    range = (1...@@number).to_a
    multiples = []
    range.each {|divisor| multiples << divisor if @@number % divisor == 0}
    sum = multiples.reduce(:+)
    check_number_against(sum)
  end

  def self.check_number_against(sum)
    if sum == @@number
      'perfect'
    elsif sum > @@number
      'abundant'
    else
      'deficient'
    end
  end
end
