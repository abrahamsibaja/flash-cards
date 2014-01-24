module Flashcards
  class Console_display
    NUMBER_OF_CARDS = 3

    attr_reader :game
    def initialize(output)
      @output = output
      @game = Game.new
    end

    def start
      game_intro
      (1..NUMBER_OF_CARDS).each do
        game.deck.take_a_random_card
        show_card
        enter_guess
        show_guess_result
      end
      show_game_score
    end

    def game_intro
      @output.puts "Welcome to Flash Cards!"
    end

    def show_card
      @output.puts "\nThe word in spanish is:"
      @output.puts "#{game.deck.card.spanish}"
    end

    def enter_guess
      @output.puts "Enter the translation of the word in english:"
      guess = gets.chop
      game.check_guess(guess)
    end

    def show_guess_result
      @output.puts game.guess_result
    end

    def show_game_score
      @output.puts "\nYou achieved #{game.score}/#{NUMBER_OF_CARDS} words"
    end
  end
end
