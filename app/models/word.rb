require_relative '../../config/environment'
require_relative '../../config/database'

class Word < ActiveRecord::Base

  # Returns an Array of Word objects which represent anagrams of this word
  # This can and should make calls to the database
  # Try to do it in as few calls as possible, without loading every word into memory. If you can't, that's ok.

    def is_anagram?(x,y)
      canonical(x) == canonical(y)
    end

    def canonical(word)
      word.downcase.chars.sort
    end

    def anagram_for?(word_input)
      dictionary = Word.select("dictionary_word")
      dictionary_array = []
      dictionary.each do |w|
        word = w.dictionary_word[0..-2]
        if word_input.length == word.length
          dictionary_array << word
        end
      end
      resultarr = []
      dictionary_array.each { |i| resultarr.push(i) if is_anagram?(word_input,i)}
      resultarr
    end
end
