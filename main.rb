#!/usr/bin/ruby

require './special_lexicon'

lexicon = SpecialLexicon.new

# Main program body -- this is what ends up on the terminal
print 'Please enter a word: '
word = gets.chomp

puts "\nYou entered the word: #{word}"

puts "\nIs it a real word? #{Lexicon.is_word?(word)}"

# Print the anagrams
puts "\nHere are all the anagrams for '#{word}':"
anagrams = lexicon.get_anagrams(word)
anagrams.each do |anagram|
  puts "\t#{anagram}"
end

# Print the words that this word prefixes
puts "\nHere are all the words prefixed by '#{word}':"
prefixed = lexicon.get_prefixed_words(word)
prefixed.each do |pre|
  puts "\t#{pre}"
end

print "\nPlease enter an end word: "
end_word = gets.chomp
ladder = lexicon.get_word_ladder(word, end_word)

puts "\nHere is the word ladder for #{word} -> #{end_word}:"
print "#{word} -> "
ladder.each do |rung|
  print "#{rung} -> "
end
puts end_word
