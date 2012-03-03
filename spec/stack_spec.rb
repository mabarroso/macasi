root = File.expand_path('../../lib', __FILE__)
require File.join(root, 'deck')
require File.join(root, 'card')
require File.join(root, 'stack')

describe Stack do
  STACK_LAST = 6

  def deck_filled
    deck = Deck.new
    STACK_LAST.times do |i|
      card = Card.new (i+1).to_s
      deck << card
    end
    deck
  end

  def filled
    deck = deck_filled
    stack = Stack.new
    stack.deck deck
  end

  it "should be empty" do
  	s = Stack.new
  	s.empty?.should == true
  end

  it "default names should be different" do
  	s1 = Stack.new
  	s2 = Stack.new
  	s1.name.should_not == s2.name
  end

  it "should add" do
    s = Stack.new
    size = s.size
    card = Card.new
    s << card
		s.size.should == size + 1
  end

  it "should delete" do
    s = Stack.new
    card = Card.new
    s << card
    size = s.size
    s.delete card
		s.size.should == size - 1
  end

  it "should be ordered" do
    s = filled
    ids_ordered = s.order
    ids = s.ids
    all_equals = true
    s.ids.size.times do |i|
      all_equals = all_equals && ids[i].equal?(ids_ordered[i])
    end

		all_equals.should be_true
  end


end
