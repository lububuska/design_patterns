require 'json'
require './class_student.rb'
require './student_list_file_base.rb'

class Student_list_JSON < Student_list_file_base
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

  def write_list_to_file
    data = @students.map(&:to_h)
    File.write(@file_path, JSON.pretty_generate(data))
  end
end