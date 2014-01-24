module Flashcards
  class Console_display
    attr_reader :game
    def initialize(output)
      @output = output
      @game = Game.new
    end

    def start
      game_intro
      game.deck.take_a_random_card
      show_card
      enter_guess
      show_result
    end

    def game_intro
      @output.puts "Welcome to Flash Cards!"
    end

    def show_card
      @output.puts "The word in spanish is:"
      @output.puts "#{game.deck.card.spanish}"
    end

    def enter_guess
      @output.puts "Enter your guess in english:"
      guess = gets.chop
      game.check_guess(guess)
    end

    def show_result
      @output.puts game.result
    end
  end
end
