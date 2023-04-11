require_relative './base_decorator.rb'

class CapitalizeDecorator < BaseDecorator
    def correct_name
        @nameable.name.upcase()
    end
end