require 'json'
require './Entities/student.rb'
require './Student_list_strategy/strategy.rb'

class Strategy_JSON < Strategy
  def read_list_from_file(file_path, students)
    if File.exist?(file_path)
      file_content = File.read(file_path)
      students = JSON.parse(file_content, symbolize_names: true).map do |student|
        Student.new(**student)
      end
    else
      students = []
    end
  end

  def write_list_to_file(file_path, students)
    data = students.map(&:to_h)
    File.write(file_path, JSON.pretty_generate(data))
  end
end