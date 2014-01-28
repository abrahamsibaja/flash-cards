require 'spec_helper'

module Flashcards
  describe Console_display do
    let(:output) { double('output').as_null_object }
    let(:display) { Console_display.new(output) }
    let(:game) { display.game }
    let(:deck) { game.deck }

    def play(*args)
      args.each do |arg|
        deck.take_a_card
        corresponding_guess(arg)
      end
    end

    def corresponding_guess(arg)
      if arg == 'correct'
        guess = deck.card.english
      else
        guess = deck.card.spanish
      end 
      display.guess_process(guess)
    end

    describe "check game score" do
      it "verifies score: all guesses are incorrect" do
        output.should_receive(:puts).with("\nYou achieved 0/3 words")
        play('incorrect', 'incorrect', 'incorrect')
        display.show_game_score
      end

      it "verifies score: all guesses are correct" do
        output.should_receive(:puts).with("\nYou achieved 3/3 words")
        play('correct', 'correct', 'correct')
        display.show_game_score
      end

      it "verifies score: 2 guesses are correct" do
        output.should_receive(:puts).with("\nYou achieved 2/3 words")
        play('correct', 'incorrect', 'correct')
        display.show_game_score
      end
    end
  end
end
