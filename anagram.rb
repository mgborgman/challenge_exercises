class Anagram
  def initialize(string)
    @word = string.downcase
  end

  def match(words)
    results = []
    words.each do |word|
      current_word = word.downcase
      next if current_word == @word
      results << word if current_word.chars.sort == @word.chars.sort
    end
    results
  end
end
