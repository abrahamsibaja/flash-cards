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

    def take_a_random_card
      @card = deck.sample
      delete_card_from_deck
    end

    def take_a_card(english_name)
      @card = deck.find{|c| c[:english] == english_name}
      delete_card_from_deck
    end

    private

    Card = Struct.new(:english, :spanish)

    def delete_card_from_deck
      deck.delete_if{|d| d[:english] == card[:english]}
    end
  end
end
