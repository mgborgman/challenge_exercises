class Phrase
  def initialize(string)
    @phrase = string.downcase
  end

  def word_count
    result = {}
    remove_new_lines_from(@phrase)
    remove_non_letter_characters_from(@phrase)
    @phrase.split.each do |word|
      letters = word.split('')
      letters.pop if letters.last !~ /[A-Za-z0-9]/
      letters.shift if letters.first !~ /[A-Za-z0-9]/
      word = letters.join
      if result.has_key?(word)
        result[word] += 1
      else
        result[word] = 1
      end
    end
    result
  end

  def remove_new_lines_from(phrase)
    phrase.gsub!(/(\\n)/, ' ')
  end

  def remove_non_letter_characters_from(phrase)
    phrase.gsub!(/[^0-9a-zA-Z']/, ' ')
  end
end
