class Stack < Deck

  def initialize name = false
    super()
    @stack      = []
    @stack_out  = []
  end

  def desk(desk)
    desk.each do |uid, card|
      self.add card
    end
  end

  def add card
    super()
    @stack << uid
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
