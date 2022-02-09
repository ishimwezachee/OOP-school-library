require './person'
class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name, parent_permission)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
