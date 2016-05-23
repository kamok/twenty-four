require_relative 'deck'
require 'pry'

def start_game
  set_game       #@player_list, @deck
  play
end

def set_game
  # set_players
  initialize_deck 
end

def initialize_deck
  @deck = Deck.new
  draw_card_to_deck
end

def draw_card_to_deck
  puts "How many normal cards?"
  @deck.pick_easy_cards(gets.chomp)
  puts "How many extra spicy cards?"
  @deck.pick_hard_cards(gets.chomp)
end

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