# class Deck
# end
require_relative 'deck'
require 'pry'

def set_game
  set_players
  initialize_deck 
end

def initialize_deck
  @deck = Deck.new
end

def set_players
  puts "Choose # of players. (1-4)"
  input = gets.chomp.to_i
  @player_list = []

  if input >= 1 and input <= 4
    input.times do |n|
      @player_list << [n + 1]
    end
  elsif 
    puts "Please enter a valid number."
  end
  @player_list
end

def play
  until game_over?
  end
end

def game_over?
  true if @deck == nil
end

def start_game
  set_game
  # play
end

start_game


