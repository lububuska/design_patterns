require 'fox16'
require "./student_list_view.rb"
require "../Student_list_strategy/student_list_file_base.rb"
require "../Student_list_strategy/strategy_JSON.rb"
include Fox
app = FXApp.new
students_list = Student_list_file_base.new('./Resources/students_example.json', Strategy_JSON.new)
Student_list_view.new(app, students_list)
app.create
app.run