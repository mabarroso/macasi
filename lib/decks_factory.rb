module Decks
  class Factory < Stack
    attr_reader :args

    class << self
      protected :new
    end

    def initialize(*args)
      super
      self.init *args if self.respond_to? :init
    end

    def self.create(type = self.class, *args)
      raise ArgumentError, "Cannot create instance of #{type} from #{self.name}" if type == self
      raise ArgumentError, "Type cannot be nil" if type.nil?

      if !type.ancestors.include?(self)
        raise ArgumentError, "#{type.name} is not a descendant of #{self.name}"
      end
      type.new(*args)
    end

    def load filename
      file = File.new(filename, 'r')
      first = true
      names = []
      file.each_line("\n") do |row|
        columns = row.split(';')
        if first
          first = false
          names = columns
        else
          data = {}
          names.count.times do |i|
            data[names[i].strip.to_sym] = columns[i]
          end
          add Card.new data[:name], data
        end
      end
    end

  end
end