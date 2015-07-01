require 'Set'
require 'byebug'

class WordChainer
  attr_accessor :current_words, :all_seen_words, :target_seen, :dictionary, :target
  def initialize
    make_dictionary
    @current_words = []
    @all_seen_words = Hash.new
    @target_seen = false
    @target = nil
  end

  def make_dictionary
    @dictionary = Set.new(File.readlines("dictionary.txt").map{|line| line.chomp.downcase})
  end

  def adjacent_words(word)
    similar_words = @dictionary.select {|dict_word| one_away(dict_word, word)}
  end

  def target_seen?
    self.target_seen
  end


  def one_away(word1, word2)
    return false unless word2.length == word1.length
    diff_letters = 0
    (0...word1.length).each do |index|
      if word1[index] != word2[index]
        diff_letters += 1
      end
    end

    diff_letters == 1
  end

  def reset_chain(source, target)
    make_dictionary
    self.dictionary = self.dictionary.select {|word| word.length == target.length}
    self.target = target
    self.current_words = [source]
    self.all_seen_words = {source => nil}
    self.target_seen = false
  end


  def run(source, target)
    reset_chain(source, target)
    until target_seen? || self.current_words.empty?
      update_current_words
    end
    if target_seen?
      puts find_backtrack(target).to_s
    else
      puts "Target word not found"
    end
  end

  def find_backtrack(word)
    if self.all_seen_words[word].nil?
      [word]
    else
      find_backtrack(self.all_seen_words[word]) + [word]
    end
  end

  def update_current_words
    self.current_words = get_new_current_words
  end

  def is_target?(word)
      word == self.target
  end

  def add_last_word(curr_word)
    @all_seen_words[self.target] = curr_word
    @target_seen = true
  end

  def get_new_current_words
    new_current_words = []
    self.current_words.each do |curr_word|
      adjacent_words(curr_word).each do |adj_word|
        if is_target?(adj_word)
          add_last_word(curr_word)
          return nil
        elsif ! self.all_seen_words.keys.include?(adj_word)
          new_current_words << adj_word
          self.all_seen_words[adj_word] = curr_word
        end
      end
    end
    new_current_words
  end


end
