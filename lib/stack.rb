class Stack < Deck

  def initialize name = false
    super
    @stack      = []
    @stack_out  = []
  end

  def add card
    super
    @stack << uid
  end

  def delete card_to_delete
    uid = super(card_to_delete)
    @stack.delete uid if uid
    uid
  end

  def from_deck deck
    deck.each do |uid, card|
      self.add card
    end
  end

  def card
    @cards[@stack[@current]]
	end

  def ids
    @stack
  end

  def order
    @cards.keys
  end

  def order!
    @stack = @cards.keys
  end

  def shuffle
    @stack.shuffle
  end

  def shuffle!
    @stack.shuffle!
  end

end
