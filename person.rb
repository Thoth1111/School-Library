class Person
    attr_accessor :name, :age
    attr_reader :id
    def initialize( id, name = 'unknown', age, parent_permission = true)
        @id = id
        @name = name
        @age = age 
    end
    def is_of_age?
        if @age >= 18
            return true
        end
        return false
    end
    def can_use_services?
        if person.age >= 18 || person.parent_permission == true
            return true
        end
        return false
    end
end