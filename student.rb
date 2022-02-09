require './person'
class Student < Person
  attr_accessor :classroom

  def initialize(_classroom,age, name = "Unknown", parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end


student1 = Student.new('classA',10,"Aku",true)
puts Student