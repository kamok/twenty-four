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

  describe "#shuffle_deck" do
    before(:each) do
      fill_deck_with_cards
    end
    it "returns all cards from the original deck" do
      card_1 = deck.deck[0]
      card_2 = deck.deck[1]
      card_3 = deck.deck[2]

      deck.shuffle_deck

      expect(deck.deck).to include(card_1 && card_2 && card_3)
    end

    it "shuffles them in a different order" do
      initial_order = deck.deck.join

      deck.shuffle_deck

      expect(deck.deck.join).to_not be(initial_order)
    end
  end

  describe "#has_no_more_cards" do
    it "returns true when there are no cards" do
      expect(deck.has_no_more_cards).to be(true)
    end
  end

  describe "#draw_card" do
    before(:each) do
      fill_deck_with_cards
    end
    it "sets current_card to the first card of the deck" do
      deck.draw_card

      expect(deck.current_card).to eq(deck.deck.first)
    end
    it "saves a copy of current_card" do
      deck.draw_card

      expect(deck.current_card).to eq(deck.instance_variable_get(:@save_card))
      save_card_data = deck.instance_variable_get(:@save_card) 

      deck.current_card = nil

      expect(deck.current_card).to eq(nil)
      expect(deck.instance_variable_get(:@save_card)).to eq(save_card_data)
    end
  end

  describe "#reset_card" do
    before(:each) do
      fill_deck_with_cards
      deck.draw_card
    end
    it "resets the current_card back to @save_card" do
      expect(deck.current_card).to eq(deck.instance_variable_get(:@save_card))

      deck.current_card = nil

      expect(deck.current_card).to eq(nil)

      deck.reset_card

      expect(deck.current_card).to eq(deck.instance_variable_get(:@save_card))
    end
  end

  

private

def fill_deck_with_cards
  deck.pick_easy_cards(2)
  deck.pick_hard_cards(1)
end

end

