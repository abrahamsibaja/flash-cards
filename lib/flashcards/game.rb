module Flashcards
  class Game
    attr_reader :deck
    def initialize(output)
      @output = output
      @deck = Deck.new
    end

    def start
      game_intro
      deck.take_a_random_card
      show_card
      enter_guess
      deck.compare_cards_name(@guess)
      show_result
    end

    def game_intro
      @output.puts "Welcome to Flash Cards!"
    end

    def show_card
      @output.puts "The word in spanish is:"
      @output.puts "#{deck.card.spanish}"
    end

    def enter_guess
      @output.puts "Enter your guess in english:"
      @guess = gets.chop
    end

    def check_answer(guess)
      puts deck.card
      @result = deck.card[:english] == guess ? "Correct":"Incorrect"
    end

    def show_result
      @output.puts @result
    end
  end
end
