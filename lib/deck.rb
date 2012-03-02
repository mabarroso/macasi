class Deck

  $deck_id = 0

  attr_accessor :name

  def initialize name = false
    $deck_id   += 1
    @id         = $deck_id
    @name       = name ? name : 'unnamed' + $deck_id.to_s
    @last_uid   = -1
    @cards      = {}
    @current    = 0
  end

  def size
    @cards.count
  end

  def empty?
    @cards.count == 0
  end

  def add card
    @cards[self.next_uid]  = card
  end

  alias :<< :add

  def each &block
    @cards.each &block
  end

  def first
    @current = 0
  end

  def last
    @current = size
  end

  def next
    @current += 1
    if @current > size
      @current = size
      return false
    end
    return true
  end

  def next?
  	@current < size
	end

  def previous
    @current -= 1
    if @current < 0
      @current = 0
      return false
    end
    return true
  end

  def previous?
  	@current > 0
	end

  def go position
    @current = position if position <= size
  end

  def current
    @current
	end

  def card
puts 'a'
puts @current
    @cards[@cards.keys[@current]]
	end

  private
    def uid
      @last_uid
    end

    def next_uid
      @last_uid += 1
    end

end
