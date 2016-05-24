require_relative 'deck'

def start_game
  initialize_deck  
  play
end

def initialize_deck
  @deck = Deck.new
  draw_card_to_deck
  @deck.shuffle_deck!
end

def draw_card_to_deck
  puts "How many normal cards?"
  @deck.pick_cards_from_master_deck("easy", gets.chomp)
  puts "How many extra spicy cards?"
  @deck.pick_cards_from_master_deck("hard", gets.chomp)
end

def play
  until @deck.has_no_more_cards
    puts "Solve this: #{@deck.draw_card}."
    until @deck.card_solved?
      puts "Try Again! #{@deck.reset_card}"
    end
    puts "Correct!"
    @deck.remove_from_deck 
  end
  puts "You're a winner!"
end

start_game

# def set_players
#   puts "Choose # of players. (1-4)"
#   input = gets.chomp.to_i
#   @player_list = []
#   if input >= 1 and input <= 4
#     input.times do |n|
#       @player_list << [n + 1]
#     end
#   else
#     puts "Please enter a valid number."
#   end
# end