require_relative './nameable.rb'

class Basedecorator
    def initialize(nameable)
        @nameable = nameable
    end

    def correct_name
        @nameable.name
    end
end