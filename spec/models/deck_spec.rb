require 'spec_helper'
require '../24/deck.rb'

describe Deck do 

  it "starts empty" do
    deck = Deck.new
    expect(deck.deck).to be_empty
  end 

  # describe "#is_input_valid?" do
  #   it "checks if input exists on the card." do
  #     deck = Deck.new
      
  #     deck.draw_card
  #     expect(deck.current_card).to eq(2)
  #   end
  # end
end

