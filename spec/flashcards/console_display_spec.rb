require 'spec_helper'

describe Flashcards::ConsoleDisplay, "#show_game_score" do
  let(:output) { double('output').as_null_object }
  let(:display) { described_class.new(output) }
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

  context "when all guesses are incorrect" do
    it "displays 0/3" do
      output.should_receive(:puts).with("\nYou achieved 0/3 words")
      play('incorrect', 'incorrect', 'incorrect')
      display.show_game_score
    end
  end

  context "when all guesses are correct" do
    it "displays 3/3" do
      output.should_receive(:puts).with("\nYou achieved 3/3 words")
      play('correct', 'correct', 'correct')
      display.show_game_score
    end
  end

  context "when 2 of 3 guesses are correct" do
    it "displays 2/3" do
      output.should_receive(:puts).with("\nYou achieved 2/3 words")
      play('correct', 'incorrect', 'correct')
      display.show_game_score
    end
  end
end
