root = File.expand_path('../..', __FILE__)
require File.join(root, %w[lib deck])
require File.join(root, %w[lib card])

describe Deck do
  before(:each) do
    c1 = Card.new 'bar', property1: 1, property2: 2
    c2 = Card.new 'foo', property1: 1, property2: 2
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

end
