require "./student"
require "./person"
class Classroom
    attr_accessor :label
    attr_reader :students

    def initialize(label)
        @label = label
        @students =[]
    end

    def add_students(student)
        @students.push(student)
        student.classroom = self
    end
end


puts student1 = Student.new('Class1',7)
class1 = Classroom.new('cleaning')
puts class1.add_students(student1)

class1.students.map {|student| p student.age}



