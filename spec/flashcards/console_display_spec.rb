require 'spec_helper'

module Flashcards
  describe Console_display do
    let(:output) { double('output').as_null_object }
    let(:display) { Console_display.new(output) }
    let(:game) { display.game}
    let(:deck) { game.deck }

    before(:each) do
      deck.take_a_card('dog')
    end

    describe "check guess" do
      it "verifies the guess is correct" do
        output.should_receive(:puts).with("Correct")
        game.check_guess('dog')
        display.show_result
      end

      it "verifies the guess is incorrect" do
        output.should_receive(:puts).with("Incorrect")
        game.check_guess('cat')
        display.show_result
      end
    end
  end
end
