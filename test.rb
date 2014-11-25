require_relative 'app/models/word'

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
      puts resultarr
    end

 # test = canonical('daring')
 anagram_for?('where')