class Deck 
  attr_accessor :deck, :current_card, :player_input, :save_card

  #I get the cards from here: http://www.4nums.com/game/difficulties/
  #I use card numbers 1-5 and numbers 1000-1010.
  EASY_MASTER_DECK = [[1,1,11,11], [1,1,4,6], [6,6,6,6], [1,1,1,8], [1,1,2,12], [2,4,4,10], [3,7,9,12], [2,2,2,5], [5,8,10,11], [7,7,9,10], [3,7,8,11], [4,4,6,10], [4,4,7,10], [6,8,9,12], [1,4,7,7]]
  
  #These are the hardest ones in the game according to the stats.
  HARD_MASTER_DECK = [[2,3,5,12], [1,4,5,6], [3,6,6,11], [2,3,8,13], [1,8,12,12]]

  def initialize 
    @deck = []
  end

  def pick_cards_from_master_deck(diffculty, qty)
    case diffculty
    when "easy"
      deck.tap { |deck| qty.to_i.times { deck << (EASY_MASTER_DECK - deck).sample } }
    when "hard"
      deck.tap { |deck| qty.to_i.times { deck << (HARD_MASTER_DECK - deck).sample } }
    end
  end

  def shuffle_deck!
    deck.shuffle!
  end

  def has_no_more_cards?
    deck.empty? ? true : false
  end

  def draw_card
    @current_card = deck.first 
    @save_card = current_card.clone
  end
 
  def reset_card
    @current_card = save_card.clone
  end

  def card_solved?
    until current_card.length == 1 
      get_player_input    
      solvable?
    end
    current_card == [24] ? true : false                                                                     
  end

  def solvable?
    if input_valid?(player_input)
      update_card(calculate_input)   
    end
    p current_card
  end

  def get_player_input
    @player_input = gets.chomp.to_s.gsub(/\s+/, "")                           
    @player_input = player_input.split(%r{(\+|\-|\/|\*)}).map do |x|          
      unless x =~ /(\+|\-|\/|\*)/ then x.to_f else x end
    end
    player_input 
  end

  def input_valid?(input)
    if current_card.include?(input.first) && current_card.include?(input.last) 
      true
    else 
      puts "A number you typed isn't even on the card."
      false
    end
  end  

  def calculate_input
    eval(player_input.join)    
  end

  def update_card(new_value)
    current_card.slice!(current_card.index(player_input.first))
    current_card.slice!(current_card.index(player_input.last))
    current_card << new_value.to_i
  end

  def remove_from_deck
    deck.delete(deck.first)
  end
end