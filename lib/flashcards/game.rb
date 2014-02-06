module Flashcards
  class Game
    attr_reader :deck, :score
    def initialize
      @deck = Deck.new
      @score = 0
    end

    def correct_guess?(guess)
      deck.card[:english] == guess.downcase
    end

    def increase_score
      @score += 1
    end
  end
end
