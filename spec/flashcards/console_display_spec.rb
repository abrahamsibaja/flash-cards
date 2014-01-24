require 'spec_helper'

module Flashcards
  describe Console_display do
    let(:output) { double('output').as_null_object }
    let(:display) { Console_display.new(output) }
    let(:game) { display.game}
    let(:deck) { game.deck }

    describe "check guess result" do
      before(:each) { deck.take_a_card('dog') }

      it "verifies the guess is correct" do
        output.should_receive(:puts).with("Correct")
        game.check_guess('dog')
        display.show_guess_result
      end

      it "verifies the guess is incorrect" do
        output.should_receive(:puts).with("Incorrect")
        game.check_guess('cat')
        display.show_guess_result
      end
    end

    describe "check game score" do
      it "verifies score: all guesses are incorrect" do
        output.should_receive(:puts).with("\nYou achieved 0/3 words")
        deck.take_a_card('dog')
        game.check_guess('x')
        deck.take_a_card('cat')
        game.check_guess('x')
        deck.take_a_card('wolf')
        game.check_guess('x')
        display.show_game_score
      end

      it "verifies score: all guesses are correct" do
        output.should_receive(:puts).with("\nYou achieved 3/3 words")
        deck.take_a_card('dog')
        game.check_guess('dog')
        deck.take_a_card('cat')
        game.check_guess('cat')
        deck.take_a_card('wolf')
        game.check_guess('wolf')
        display.show_game_score
      end

      it "verifies score: 2 guesses are correct" do
        output.should_receive(:puts).with("\nYou achieved 2/3 words")
        deck.take_a_card('dog')
        game.check_guess('dog')
        deck.take_a_card('cat')
        game.check_guess('cat')
        deck.take_a_card('wolf')
        game.check_guess('x')
        display.show_game_score
      end
    end
  end
end
