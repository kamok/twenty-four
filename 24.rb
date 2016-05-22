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
    puts "Solve this: #{@deck.current_card}."
    if @deck.card_solved?
      puts "Correct!"
      # if @player_list > 1
      #   puts "Who got that right?" 
      #   add_point(gets.chomp)
      # end
    else 
      puts "Try again."
      play
    end
  end
  puts "You're a winner!"
end

start_game