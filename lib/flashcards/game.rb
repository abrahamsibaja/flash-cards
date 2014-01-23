module Flashcards
  class Game
    attr_reader :deck, :result
    def initialize
      @deck = Deck.new
    end

    def check_answer(guess)
      @result = deck.card[:english] == guess ? 'Correct':'Incorrect'
    end
  end
end
