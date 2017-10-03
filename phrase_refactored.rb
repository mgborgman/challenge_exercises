class Phrase
  def initialize(string)
    @phrase = string.downcase
  end

  def word_count
    result = {}
    words = @phrase.scan(/\b[\w']+\b/)
    words.each do |word|
      if result.has_key?(word)
        result[word] += 1
      else
        result[word] = 1
      end
    end
    result
  end
end