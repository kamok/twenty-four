require 'spec_helper'
require '../24/deck.rb'
require 'pry'

describe Deck do 
  let(:deck) { Deck.new }

  it "starts empty" do
    expect(deck.deck).to be_empty
  end

  describe "#pick_easy_cards" do
    it "can add cards from the easy master deck" do
      deck.pick_easy_cards(1)
      expect(deck.deck).to_not be_empty
    end

    it "adds precisely n number of cards from input" do
      n = 5
      deck.pick_easy_cards(n)
      expect(deck.deck.count).to be(n)
    end
  end

  describe "#pick_hard_cards" do
    it "can add cards from the hard master deck" do
      deck.pick_hard_cards(1)
      expect(deck.deck).to_not be_empty
    end 

    it "adds precisely n number of cards from input" do
      n = 5
      deck.pick_hard_cards(n)
      expect(deck.deck.count).to be(n)
    end
  end

  describe "#draw_card" do
    before(:each) do
      deck.pick_easy_cards(3)
      expect(deck.deck).to_not be_empty
    end
    it "draws a random card from deck on start of game" do
      expect(deck.current_card).to be(nil)

      deck.draw_card

      expect(deck.current_card).to_not be_empty
    end

    # it "draws a card"
  end

end

