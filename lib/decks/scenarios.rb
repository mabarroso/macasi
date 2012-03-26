Dir['../scenarios/*.rb'].each {|file| require file }

module Decks
  class Scenarios < Stacks::Factory
    class << self
      private :create
    end

    def initialize(*args)
      init
    end

    def init
    end
  end
end