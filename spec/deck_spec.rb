root = File.expand_path('../../lib', __FILE__)
require File.join(root, 'deck')
require File.join(root, 'card')

describe Deck do
  LAST = 4

  def filled
    deck = Deck.new
    LAST.times do |i|
      card = Card.new (i+1).to_s
      deck << card
    end
    deck
  end

  it "should be empty" do
  	d = Deck.new
  	d.empty?.should == true
  end

  it "default names should be different" do
  	d1 = Deck.new
  	d2 = Deck.new
  	d1.name.should_not == d2.name
  end

  it "should be first equal 1" do
  	d = filled
		d.first
		d.card.name.should == '1'
  end

  it "should be last equal {LAST}" do
  	d = filled
		d.last
		d.card.name.should == LAST.to_s
  end

  it "should be last-1 equal {LAST-1}" do
  	d = filled
		d.last
		d.previous
		d.card.name.should == (LAST-1).to_s
  end

  it "should be go to first position equal first" do
  	d = filled
  	d.first
  	position = d.current
  	d.last
  	d.go position
  	d.current.should == position
  end

  it "should be go to last position equal last" do
  	d = filled
  	d.last
  	position = d.current
  	d.first
  	d.go position
  	d.current.should == position
  end

  it "should be false when next from last" do
  	d = filled
  	d.last
  	d.next.should == false
  end

  it "should be false when previous from last" do
  	d = filled
  	d.first
  	d.previous.should == false
  end

  it "should be last when next from last" do
  	d = filled
  	d.last
  	d.next
    d.current.should == d.last
  end

  it "should be first when previous from first" do
  	d = filled
  	d.first
  	d.previous
    d.current.should == d.first
  end

  it "should be no next from last" do
  	d = filled
		d.last
		d.next?.should == false
  end

  it "should be no previous from first" do
  	d = filled
		d.first
		d.previous?.should == false
  end

  it "should be next from first" do
  	d = filled
		d.first
		d.next?.should == true
  end

  it "should be previous from last" do
  	d = filled
		d.last
		d.previous?.should == true
  end

  it "should be next from previous of last" do
  	d = filled
		d.last
		d.previous
		d.next?.should == true
  end

  it "should be previous from next of first" do
  	d = filled
		d.first
		d.next
		d.previous?.should == true
  end

end
