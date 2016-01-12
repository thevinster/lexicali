# Lexicali

## The Problem

We provided a lexicon of words and the code to read the lexicon into memory.
We want to write a short script that does the following:

* Generates all possible anagrams of the word
* Finds all words with a given prefix
* Prints the shortest possible word ladder between two words

The stubs are provided inside `special_lexicon.rb`. You'll need to make sure you
run the code from within this directory by calling `ruby main.rb`. You can place
all your code inside that file, but you are welcome to modify `lexicon.rb` if
you want to change any functionality in that class.

Please also write a few quick comments for each method describing how you
decided to solve the problem.  It's perfectly acceptable and encouraged to use
the internet for help (that's what you'll be doing on the job, no?), just make
sure you cite any sources.

When you're done (or even in the middle), please push the code back up to this
repository.

## What we're looking for

* Clean, easy to read, and easy to understand code
* Efficient implementations
* It runs and produces the correct results

## Some hints

### Anagrams

* Can you find the anagram for marsipobranchiata?

### Prefixed words

* The simple solution is O(n), can you do better?

### Word ladder

* Non-lexicon start and end words should print something sensible
* The word ladder from chair -> table is found efficiently

# Some Helpful Info

Anagram: A rearranging of the letters of a word to form a new dictionary word,
using each letter from the original word exactly once. For example, 'act' is an
anagram for 'cat' but 'tca' is not.

Word Ladder: The shortest possible chain between two words where each step in
the chain differs by only a single letter. The start and end words must be the
same length.
Example: cold -> cord -> card -> ward -> warm
See: http://en.wikipedia.org/wiki/Word_ladder
