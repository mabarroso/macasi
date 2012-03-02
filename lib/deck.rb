class Deck

  $deck_id = 0

  attr_accessor :name

  def initialize name = false
    $deck_id   += 1
    @id         = $deck_id
    @name       = name ? name : 'unnamed' + $deck_id.to_s
    @last_uid   = 0
    @cards      = {}
    @stack      = []
    @stack_out  = []
  end

  def size
    @cards.count
  end

  def empty?
    @cards.count == 0
  end

  def add card
    @cards[next_uid]  = card
    @stack << uid
  end

  def shuffle
  end

  def shuffle!
  end

  alias :<< :add

  private
    def uid
      @last_uid
    end

    def next_uid
      @last_uid += 1
    end

end
