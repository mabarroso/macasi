root = File.expand_path('../../lib', __FILE__)
require File.join(root, 'decks')

describe 'Scenes' do
  def filled
    root = File.expand_path('../../lib', __FILE__)
    Decks.flap :scenes, '1st', root + '/../data/first_floor.dat'
  end

  it "should be empty" do
  	d = Decks.flap :scenes
  	d.empty?.should be_true
  end

  it "should not be empty" do
  	d = filled
  	d.empty?.should be_false
  end

  it "should have border_mask" do
  	s = filled
  	s.first
  	s.card.body.should have_key(:border_mask)
  end

end
