#!/usr/bin/ruby

require './lexicon'
require 'set'
require 'pry'

class SpecialLexicon < Lexicon
  
  # Generates an array of all the anagrams of the given word
  def get_anagrams(word)
    ans = Set.new
    word.chars.permutation.map(&:join).each do |permuted_word|
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
    unless Lexicon.is_word?(end_word)
      puts "end_world is not a valid word"
      exit
    end

    unless start_word.length == end_word.length
      puts "end_world is not the same length as start_word"
      exit
    end

    bfsHash = {}
    visited = {}
    ans = []
    queue = Queue.new

    queue << start_word.dup
    start_word_cpy = start_word.dup
    while !queue.empty?
      word = queue.pop
      start_word = word.dup
      bfsHash[word] = Set.new
      (0..start_word.length-1).each do |i|
        ("a".."z").each do |letter|
          start_word[i] = letter
          if Lexicon.is_word?(start_word) and start_word != word
            bfsHash[word] << start_word.dup if visited[start_word] == nil
            queue << start_word.dup if visited[start_word] == nil
            visited[start_word] = word if visited[start_word] == nil
          end

          break if start_word == end_word

        end
        break if start_word == end_word
        start_word = word.dup
      end
      break if start_word == end_word
    end

    while visited[start_word] != start_word_cpy
      ans << visited[start_word].dup
      start_word = visited[start_word].dup
    end
    
    start_word = start_word_cpy
    ans.reverse
  end
end

