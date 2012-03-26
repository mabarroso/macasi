root = File.expand_path('../../lib', __FILE__)
require File.join(root, 'card')
require File.join(root, 'deck')
require File.join(root, 'stack')
require File.join(root, 'decks_factory')
require File.join(root, 'decks/scenes')

module Decks
  def self.flap type, name = false, filename = false
    deck = Factory.create eval(type.to_s.capitalize), name
    deck.load filename if filename
    deck
  end
end