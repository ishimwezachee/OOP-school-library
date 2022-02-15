require './classroom'
require './student'

describe Classroom do
  context 'It should create a new class with label' do
    classroom_one = Classroom.new
    classroom_one.intitialize('Maths')
    student_one = Student.new(age: 10, classroom: nil, name: 'Cap', parent_permission: true)

    it 'should create new classroom with label' do
      expect(classroom_one.label).to eq 'Maths'
    end
  end
end

describe Classroom do
  before :each do
    @classroom = Classroom.new
  end
  it 'return a new book object' do
    expect(@classroom).to be_an_instance_of(Classroom)
  end
end
