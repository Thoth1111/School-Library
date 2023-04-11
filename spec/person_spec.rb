require './src/person'
require './src/base_decorator'
require './src/capitalize_decorator'
require './src/trimmer_decorator'

person = Person.new(22, name: 'maximilianus')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name
