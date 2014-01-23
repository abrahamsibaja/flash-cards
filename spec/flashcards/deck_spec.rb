require 'spec_helper'

module Flashcards
  describe Game do
    let(:output) { double('output').as_null_object }
    let(:game) { Game.new(output) }

    before(:each) {game.deck.take_a_card('dog')}

    describe "check answer" do
      it "correct answer" do
        output.should_receive(:puts).with("Correct")
        game.check_answer('dog')
        game.show_result
      end

      it "incorrect answer" do
        output.should_receive(:puts).with("Incorrect")
        game.check_answer('cat')
        game.show_result
      end
    end
  end
end
