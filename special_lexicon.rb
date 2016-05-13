#!/usr/bin/ruby

require './lexicon'
require 'set'

class SpecialLexicon < Lexicon
  
  # Generates an array of all the anagrams of the given word
  def get_anagrams(word)
    ans = Set.new
    word.chars.permutation.map(&:join).each do |permuted_word|
      # Check if permuted_word is valid
      ans << permuted_word if Lexicon.is_word?(permuted_word)
    end
    return ans.to_a
  end


  # Generates an array of all the words that have the given word as a prefix
  def get_prefixed_words(prefix)
    return Lexicon.scan(prefix)
  end


  # Generates the shortest possible word ladder connecting the two words
  def get_word_ladder(start_word, end_word)
    ans = []
    flag = false
    unless Lexicon.is_word?(end_word)
      puts "end_world is not a valid word"
      exit
    end

    unless start_word.length == end_word.length
      puts "end_world is not the same length as start_word"
      exit
    end

    unless Lexicon.is_word?(start_word)
      return ans, flag
    end

    if start_word == end_word
      flag = true
      return ans, flag
    end

    ans << start_word.dup
    
    (0..start_word.length-1).each do |i|
      if start_word[i] != end_word[i]
        #ans << start_word.dup
        temp = start_word[i]
        start_word[i] = end_word[i]
        #puts temp, start_word
        ladder, _ = get_word_ladder(start_word, end_word)
        ladder.each {|v| ans.push v}
        if start_word == end_word
          flag = true
          return ans, flag
        end
        #ans.pop
        start_word[i] = temp
      end      
    end
    return ans, flag
  end

end

