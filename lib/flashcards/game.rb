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
  end
end
