def is_anagram?(x,y)
  canonical(x) == canonical(y)
end

def canonical(word)
  word.downcase.chars.sort
end

def anagram_for?(word,dictionary)
  resultarr = []
  dictionary.each { |i| resultarr.push(i) if is_anagram?(word,i)}
  resultarr

  # resultarr = []
  # word_given = word.downcase.chars.sort
  # dictionary.each { |i| resultarr.push(i) if word_given == i.downcase.chars.sort}
  # p resultarr
end

dictionary = ['acres', 'cares', 'Cesar', 'races', 'smelt', 'melts', 'etlsm']
p anagram_for?("cares", dictionary)