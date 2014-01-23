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

    describe "check answer" do
      it "correct answer" do
        output.should_receive(:puts).with("Correct")
        game.check_answer('dog')
        display.show_result
      end

      it "incorrect answer" do
        output.should_receive(:puts).with("Incorrect")
        game.check_answer('cat')
        display.show_result
      end
    end
  end
end
