require 'json'
require './class_student.rb'
require './short_class_student.rb'
require './Data/data_list_student_short.rb'

class Student_list_JSON
  def initialize(file_path)
    @file_path = file_path
    @students = read_list_from_file
  end

  def read_list_from_file
    if File.exist?(@file_path)
      file_content = File.read(@file_path)
      @students = JSON.parse(file_content, symbolize_names: true).map do |student|
        Student.new(**student)
      end
    else
      @students = []
    end
  end

  def write_list_to_file()
    data = @students.map(&:to_h)
    File.write(@file_path, JSON.pretty_generate(data))
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

  private
  attr_accessor :file_path, :students
end