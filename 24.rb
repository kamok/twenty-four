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
  @deck = Deck.new.draw
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
end

def play
   until @deck.length == 0
      puts "Solve this: #{@deck.last}."
      if solved?
        puts "Correct!"
        @deck.pop
        if @player_list > 1
          puts "Who got that right?" 
          add_point(gets.chomp)
        end
      else 
        puts "Try again."
        play
      end
   end
end

def solved?                                                         #Solve this: [1, 4, 5, 6]. 
  player_input = gets.chomp.to_s.gsub(/\s+/, "")                    #"1 + 4" => 1+4"

  player_input = player_input.split(%r{(\+|\-|\/|\*)}).map do |x|   #[1.0, "+", 4.0]
      unless x =~ /(\+|\-|\/|\*)/ then x.to_f else x end
  end   

  binding.pry                                           


  # f = [1.0, "+", 4.0]
  # loop do
  #   if @deck.last.include?(f.first||f.last)
  #     #remove f.first and f.last from @deck's array
  #     #eval the shit and put it inside @deck

  #   else
  #   "The number you typed isn't even on the card..."
  #   false
  #   end
  # break if false
end

start_game