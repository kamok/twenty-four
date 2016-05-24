require 'spec_helper'
require '../24/deck.rb'

describe Deck do 
  let(:deck) { Deck.new }

  it "starts empty" do
    expect(deck.deck).to be_empty
  end

  describe "pick_cards_from_master_deck" do
    it "allows an easy argument and qty argument" do
      expect(deck.pick_cards_from_master_deck("easy", "5")).to be_truthy
    end

    it "allows an hard argument and qty argument" do
      expect(deck.pick_cards_from_master_deck("hard", "2")).to be_truthy
    end

    it "adds precisely n number of cards from input" do
      n = 5
      deck.pick_cards_from_master_deck("easy", n)
      expect(deck.deck.count).to be(n)
    end
  end

  describe "#shuffle_deck!" do
    before(:each) do
      fill_deck_with_cards
    end
    it "returns all cards from the original deck" do
      deck_before_shuffle = deck.deck.dup

      deck.shuffle_deck!

      expect(deck.deck) =~ deck_before_shuffle
    end

    it "shuffles them in a different order" do
      initial_order = deck.deck.join

      deck.shuffle_deck!

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

      expect(deck.current_card).to eq(deck.save_card)
      save_card_data = deck.save_card 

      deck.current_card = nil

      expect(deck.current_card).to eq(nil)
      expect(deck.save_card).to eq(save_card_data)
    end
  end

  describe "#reset_card" do
    before(:each) do
      fill_deck_with_cards
      deck.draw_card
    end
    it "resets the current_card back to @save_card" do
      expect(deck.current_card).to eq(deck.save_card)

      deck.current_card = nil

      expect(deck.current_card).to eq(nil)

      deck.reset_card

      expect(deck.current_card).to eq(deck.save_card)
    end
  end

  describe "#card_solved?" do
    before(:each) do
      deck.pick_cards_from_master_deck("hard", 1)
      deck.draw_card
    end
    #######################
    # Is this untestable???
    #######################
    # it "calls solvable? if current_card has more than one value inside" do
    #   expect(deck.current_card.length).to be(4)
    #   expect(deck).to receive(:solvable?)
    #   first_num, last_num = deck.current_card.first, deck.current_card.last
    #   allow(deck).to receive(:gets) {"#{first_num}-#{last_num}"}
    #   deck.card_solved?
    # end
    it "returns true if the current_card is 24" do
      deck.current_card = [24]
      expect(deck.card_solved?).to be(true)
    end
    it "returns false if current_card is NOT 24" do
      deck.current_card = [23]
      expect(deck.card_solved?).to be(false)
    end
  end

  describe "#solvable?" do
    before(:each) do
      fill_deck_and_draw_card
      input_valid_player_input
    end
    it "calls is_input_valid? with player_input" do
      expect(deck).to receive(:input_valid?).with( deck.player_input )
      deck.solvable?
    end

    it "calls updates card with calculate_input if input is valid" do
      expect(deck).to receive(:update_card).with( deck.calculate_input )
      deck.solvable?
    end

    it "prints the current_card" do
      expect(deck).to receive(:input_valid?).with( deck.player_input )
      expect(deck.solvable?).to be(deck.current_card)
    end
  end

  describe "#get_player_input" do
    it "takes in a player input of an operation and returns it in an array with floats" do
    allow(deck).to receive(:gets) {"5+5"}
    expect(deck.get_player_input).to eq([5.0, "+" , 5.0])

    allow(deck).to receive(:gets) {"7*9"}
    expect(deck.get_player_input).to eq([7.0, "*" , 9.0])
    end
  end

  describe "#input_valid?" do
    before(:each) do
      fill_deck_and_draw_card
      suppress_output
    end
    it "returns true if input contains numbers from the current_card" do
      first_num, last_num = deck.current_card.first, deck.current_card.last
      allow(deck).to receive(:gets) {"#{first_num}-#{last_num}"}
      deck.get_player_input

      expect(deck.input_valid?(deck.player_input)).to be(true)
    end

    it "returns false if input contains ANY numbers NOT from the current_card" do
      allow(deck).to receive(:gets) {"99/99"}
      deck.get_player_input

      expect(deck.input_valid?(deck.player_input)).to be(false)
    end
  end

  describe "#calculate_input" do
    before(:each) do
      fill_deck_and_draw_card
      input_valid_player_input
    end
    it "evaluates the player_input as a string operation" do
      expect(deck.calculate_input).to eq(eval(deck.player_input.join))
    end
    it "returns a float" do
      expect(deck.calculate_input).to be_a(Float)
    end
  end

  describe "#update_card" do
    before(:each) do
      fill_deck_and_draw_card
      input_valid_player_input
    end

    it "decreases the number of values in current_card by 1" do 
      expect(deck.current_card.count).to be(4)
      deck.update_card(deck.calculate_input)
      expect(deck.current_card.count).to be(3)
    end
  end

  describe "#remove_from_deck" do
    before(:each) do
      fill_deck_with_cards
    end
    it "removes a card from the deck" do
      deck.remove_from_deck

      expect(deck.deck.count).to eq(2)
    end
    it "removes the first card from the deck" do
      first_card = (deck.deck.first)
      deck.remove_from_deck


      expect(deck.deck.first).to_not be(first_card)
    end
  end

  private

  def fill_deck_with_cards
    deck.pick_cards_from_master_deck("easy", 2)
    deck.pick_cards_from_master_deck("hard", 1)
  end

  def fill_deck_and_draw_card
    fill_deck_with_cards
    deck.draw_card
  end

  def input_valid_player_input
    first_num, last_num = deck.current_card.first, deck.current_card.last
    allow(deck).to receive(:gets) {"#{first_num}-#{last_num}"}
    deck.get_player_input
  end

end