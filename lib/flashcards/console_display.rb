module Flashcards
  class ConsoleDisplay
    NUMBER_OF_CARDS = 3

    attr_reader :game
    def initialize(output)
      @output = output
      @game = Game.new
    end

    def start
      game_intro
      (1..NUMBER_OF_CARDS).each do
        game.deck.take_a_card
        show_card
        enter_guess
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
      guess_process gets.chop
    end

    def show_game_score
      @output.puts "\nYou achieved #{game.score}/#{NUMBER_OF_CARDS} words"
    end

    def guess_process(guess)
      if game.correct_guess?(guess)
        @output.puts 'Correct'
        game.increase_score
      else
        @output.puts 'Incorrect'
      end
    end

    private

    def print(string)
      @output.puts string
    end
  end
end
