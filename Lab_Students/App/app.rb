require 'fox16'
require_relative "../view/student_list_view.rb"
require_relative "../model/student_list_strategy/student_list_file_base.rb"
require_relative "../model/student_list_strategy/strategy_JSON.rb"
include Fox

app = FXApp.new
Student_list_view.new(app)
app.create
app.run