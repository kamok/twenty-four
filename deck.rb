require 'pry'
class Deck 
  attr_accessor :deck 

  EASY_MASTER_DECK = [[1,1,11,11], [1,1,4,6], [6,6,6,6], [1,1,1,8], [1,1,2,12], [1,2,2,6]]
  HARD_MASTER_DECK = [[2,3,5,12], [1,4,5,6], [3,6,6,11], [2,3,8,13], [1,8,12,12]]

  def initialize
    @deck = []
    draw
  end

  def draw
    puts "How many normal cards?"
    pick_easy_cards(gets.chomp)
    puts "How many extra spicy cards?"
    pick_hard_cards(gets.chomp)
  end

  def card_solved?                                                         #Solve this: [1, 4, 5, 6]. 
  player_input = gets.chomp.to_s.gsub(/\s+/, "")                           #"1 + 4" => 1+4"
  player_input = player_input.split(%r{(\+|\-|\/|\*)}).map do |x|          #[1.0, "+", 4.0]
    unless x =~ /(\+|\-|\/|\*)/ then x.to_f else x end
  end   
                                        
  if @current_card.include?(player_input.first && player_input.last)
    true
  else
    puts "The number you typed isn't even on the card..."
    false
  end
  remove_from_deck
end

  def has_no_more_cards
    deck.length > 0 ? false : true
  end

  def current_card
    @current_card = deck.sample
  end

  private

  def remove_from_deck
    deck.delete(@current_card)
  end

  def pick_easy_cards(n)
    deck.tap { |deck| n.to_i.times { deck << (EASY_MASTER_DECK - deck).sample } }
  end

  def pick_hard_cards(n)
    deck.tap { |deck| n.to_i.times { deck << (HARD_MASTER_DECK - deck).sample } }
  end

end