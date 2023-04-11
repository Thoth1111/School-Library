require_relative './nameable.rb'

class BaseDecorator
    def initialize(nameable)
        @nameable = nameable
    end

    def correct_name
        @nameable.name
    end
end