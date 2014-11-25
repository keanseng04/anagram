# require 'rack'
# require_relative '../config'

require_relative '../app/models/word'

file = File.open(File.dirname(__FILE__) + "/../app/words.txt")

file.each do |line|
  Word.create(dictionary_word: line[0..-2])
end


# require_relative '../app/models/word'

# file = File.open(File.dirname(__FILE__) + "/../app/words.txt")

# file.each do |line|
#   p line
#   # Word.create(dictionary_word: line)
# end