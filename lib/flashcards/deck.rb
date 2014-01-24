module Flashcards
  class Deck
    attr_reader :deck, :card
    def initialize
      @deck = [
               Card.new('dog', 'perro'), 
               Card.new('cat', 'gato'),
               Card.new('tiger', 'tigre'),
               Card.new('wolf', 'lobo'),
               Card.new('cow', 'vaca'),
               Card.new('horse', 'caballo'),
               Card.new('elephant', 'elefante'),
               Card.new('gen', 'gallina')
      ]
    end

    Card = Struct.new(:english, :spanish)

    def take_a_random_card
      @card = deck.sample
    end

    def take_a_card(english_name)
      @card = deck.find{|c| c[:english] == english_name}
    end
  end
end
