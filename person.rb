require './corrector'
require './rental'
class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def can_use_services?
    of_age? || parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(name)
  end

  def add_rental(date,person)
    Rental.new(date,self,person)
  end

  private

  def of_age?
    @age >= 18
  end
end
