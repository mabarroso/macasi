require File.expand_path('../card', __FILE__)
require File.expand_path('../deck', __FILE__)
require File.expand_path('../stack', __FILE__)
require File.expand_path('../decks_factory', __FILE__)
Dir['../decks/*.rb'].each {|file| require file }

module Decks
  def self.flap name
    Factory.create eval name.to_s.capitalize
  end
end