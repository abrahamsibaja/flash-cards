module Flashcards
  class Game
    attr_reader :deck, :guess_result, :score
    def initialize
      @deck = Deck.new
      @score = 0
    end

    def check_guess(guess)
      @guess_result = deck.card[:english] == guess ? 'Correct':'Incorrect'
      @score += 1 if guess_result == 'Correct'
    end
  end
end
