require 'spec_helper'

describe Flashcards::Game, "#correct_guess?" do
  let(:deck) { subject.deck }

  before { deck.take_a_card('dog') }

  context "when the guess is correct" do
    it "returns true" do
      expect(subject.correct_guess?('dog')).to be_true
    end
  end

  context "when the guess is incorrect" do
    it "returns false" do
      expect(subject.correct_guess?('cat')).to be_false
    end
  end
end

describe Flashcards::Game, "#increase_score" do

  def set_score(number)
    (1..number).each {subject.increase_score}
  end

  context "when the score is 0" do
    it "increases to 1" do
      expect(subject.increase_score).to eq(1)
    end
  end

  context "when the score is 1" do
    it "increases to 2" do
      set_score(1)
      expect(subject.increase_score).to eq(2)
    end
  end

  context "when the score is 7" do
    it "increases to 8" do
      set_score(7)
      expect(subject.increase_score).to eq(8)
    end
  end
end
