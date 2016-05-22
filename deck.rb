require 'pry'
class Deck 
  attr_accessor :deck, :current_card

  EASY_MASTER_DECK = [[1,1,11,11], [1,1,4,6], [6,6,6,6], [1,1,1,8], [1,1,2,12], [1,2,2,6]]
  HARD_MASTER_DECK = [[2,3,5,12], [1,4,5,6], [3,6,6,11], [2,3,8,13], [1,8,12,12]]

  def initialize
    @deck = []
  end

  def card_solved?         #if true, then we gp to next card, if false, then we keep doing it.
    is_input_valid?(get_player_input)
    # evaluate_input                                                #Solve this: [1, 4, 5, 6]. 
  end

  def get_player_input
    player_input = gets.chomp.to_s.gsub(/\s+/, "")                           #"1 + 4" => 1+4"
    player_input = player_input.split(%r{(\+|\-|\/|\*)}).map do |x|          #[1.0, "+", 4.0]
      unless x =~ /(\+|\-|\/|\*)/ then x.to_f else x end
    end
    player_input 
  end

  def is_input_valid?(input)
    if @current_card.include?(input.first && input.last)
      true
    else
      puts "A number you typed isn't even on the card..."
      p @current_card
      false
    end
  end  

  # def evaluate_input
  #     new_value = eval(player_input.join)
  #     remove_from_deck
  # end

  def has_no_more_cards
    deck.empty? ? true : false
  end

  def draw_card
    @current_card = deck.sample
  end


  def pick_easy_cards(n)
    deck.tap { |deck| n.to_i.times { deck << (EASY_MASTER_DECK - deck).sample } }
  end

  def pick_hard_cards(n)
    deck.tap { |deck| n.to_i.times { deck << (HARD_MASTER_DECK - deck).sample } }
  end

  private

  def remove_from_deck
    deck.delete(@current_card)
  end

end