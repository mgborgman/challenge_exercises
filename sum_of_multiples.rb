class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(limit)
    SumOfMultiples.new(3,5).to(limit)
  end

  def to(limit)
    sum = 0
    # iterate over all numbers from 1 to limit
    1.upto(limit - 1) do |number|
      # check if number is evenly divisable by any of the numbers in @multiples
      @multiples.each do |divisor|
        # if yes, add number to sum
        if number % divisor == 0
          sum += number
          break
        end
      end
    end
    # return sum
    sum
  end
end

