require './Entities/student_short.rb'
require './Data/Data_list/data_list_student_short.rb'

class Student_list_file_base
  attr_accessor :strategy

  def initialize(file_path, strategy)
    @file_path = file_path
    @strategy = strategy
    @students = read_list_from_file
  end

  def get_student_by_id(id)
    @students.find{ |student| student.id == id}
  end

  def get_k_n_student_short_list(k, n, existing_data_list = nil)
    start_index = (k - 1) * n
    slice = @students[start_index, n] || []
    student_shorts = slice.map{ |student| StudentShort.from_student(student) }
    
    if existing_data_list
      existing_data_list.replace(student_shorts)
      existing_data_list
    else
      Data_list_student_short.new(student_shorts)
    end
  end

  def sort_by_surname_and_initials()
    @students = @students.sort_by { |student| student.get_fio }
  end

  def add_student(student)
    new_id = (@students.map(&:id).max || 0) + 1
    student.id = new_id
    @students.push(student)
  end

  def replace_student(id, new_student)
    index = @students.find_index { |student| student.id == id }
    raise IndexError, 'Student with such id does not exist' unless index
    new_student.id = id
    @students[index] = new_student
  end

  def delete_by_id(id)
    @students.delete_if {|student| student.id = id}
  end

  def get_student_short_count()
    @students.size
  end

  def read_list_from_file
    @strategy.read_list_from_file(@file_path, @students)
  end

  def write_list_to_file
    @strategy.write_list_to_file(@file_path, @students)
  end

  protected
  attr_accessor :file_path, :students
end