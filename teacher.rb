require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, _name = 'unknown', _parent_permission: true)
    super(age, _name = 'unknown', _parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
