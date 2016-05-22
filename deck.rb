require 'pry'
class Deck 
  attr_accessor :deck 

  def initialize
    @deck = []
  end

  def draw
    puts "How many normal cards?"
    pick_easy_cards(gets.chomp)
    puts "How many extra spicy cards?"
    pick_hard_cards(gets.chomp)
  end

  def pick_easy_cards(n)
    deck.tap { |deck| n.to_i.times { deck << (EASY_MASTER_DECK - deck).sample } }
  end

  def pick_hard_cards(n)
    deck.tap { |deck| n.to_i.times { deck << (HARD_MASTER_DECK - deck).sample } }
  end
  
  EASY_MASTER_DECK = [
    [1,1,11,11],
    [1,1,4,6],
    [6,6,6,6],
    [1,1,1,8],
    [1,1,2,12],
    [1,2,2,6]
  ]

  HARD_MASTER_DECK = [
    [2,3,5,12],
    [1,4,5,6],
    [3,6,6,11],
    [2,3,8,13],
    [1,8,12,12],
  ]

end