module Decks
  class Scenes < Decks::Factory
    class << self
      private :create
    end

    def init *args
    end

    def add card
      super
      @cards[uid].body[:border_mask] = @cards[uid].body[:borders] + @cards[uid].body[:borders]
    end

  end
end