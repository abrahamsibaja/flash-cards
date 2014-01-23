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

    def show_result
      @output.puts deck.result
    end

  end

  class Deck
    attr_reader :deck, :card, :result
    def initialize
      @deck = [Card.new('dog','perro'), Card.new('cat','gato')]
    end

    def take_a_random_card
      @card = deck.sample
    end
    
    def take_a_card(english_name)
      @card = deck.find{|card| card[:spanish] == english_name}
    end

    def compare_cards_name(guess)
      @result = card.english == guess ? "Correct":"Incorrect"
    end
  end

  Card = Struct.new(:english, :spanish)
end

system('clear')
game = Flashcards::Game.new(STDOUT)
game.start
