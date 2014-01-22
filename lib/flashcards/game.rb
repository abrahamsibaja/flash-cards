module Flashcards
  class Game
    attr_reader :deck
    def initialize(output)
      @output = output
      @deck = Deck.new
    end

    def start
      deck.take_a_card
      @output.puts "Welcome to Flash Cards!"
      @output.puts "The word in spanish is:"
      @output.puts "#{deck.card.spanish}"
      enter_guess
      deck.compare_cards_name(@guess)
    end

    def enter_guess
      @output.puts "Enter guess:"
      @guess = gets.chop
    end

  end

  class Deck
    attr_reader :deck, :card
    def initialize
      @deck = [Card.new('dog','perro'), Card.new('cat','gato')]
    end

    Card = Struct.new(:english, :spanish)

    def take_a_card
      @card = deck.sample
    end

    def compare_cards_name(name)
      result = card[:english] == name ? "Correct":"Incorrect"
      puts result
    end
  end
end

game = Flashcards::Game.new(STDOUT)
game.start
