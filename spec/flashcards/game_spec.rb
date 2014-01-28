require 'spec_helper'

module Flashcards
  describe Game do
    let(:game) { Game.new }
    let(:deck) { game.deck }

     describe "check guess result" do
      before(:each) { deck.take_a_card('dog') }

      context "when the guess is correct" do
        it "the result is 'Correct'" do
          expect(game.correct_guess?('dog')).to be_true
        end
      end

      context "when the guess is incorrect" do
        it "the result is 'Incorrect'" do
          expect(game.correct_guess?('cat')).to be_false
        end
      end
    end
  end
end
