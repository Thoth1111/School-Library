require_relative './base_decorator.rb'

class TrimmerDecorator
    def correct_name
        @nameable.name.slice(0, 10)
    end
end