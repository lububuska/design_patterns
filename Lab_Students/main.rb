require './Entities/student.rb'
require './Entities/student_short.rb'
require './Data/Data_list/data_list_student_short.rb'
require './Data/Data_list/data_list.rb'
require './Student_list_strategy/strategy_JSON.rb'
require './Student_list_strategy/strategy_YAML.rb'
require './Student_list_strategy/student_list_file_base.rb'
require './DB/connecting.rb'
require './DB/student_list_DB.rb'


student1 = Student.new(surname: "Масенко", name: "Мария", fathername: "Сергеевна", birthday: 1076532600, id: 1, git: "github.com/lububuska", email: "masenko.maria2004@gmail.com")
student2 = Student.new(surname: "Аникин", name: "Марк", fathername: "Андреевич", birthday: 1034455800, id: 2, git: "github.com/Corray333", tg: "@corray")
student3 = Student.new(surname: "Иванов", name: "Иван", fathername: "Иванович", birthday: 946759800, id: 3, email: "ivanTheBest@mail.ru", git: "github.com/ivanTheBest")
student4 = Student.new(surname: "Иванов", name: "Алексей", fathername: "Николаевич", birthday: 1027205400, id: 4, git: "github.com/alekseyivanov", email: "ivanov.aleksey2003@gmail.com")
student5 = Student.new(surname: "Смирнова", name: "Ольга", fathername: "Викторовна", birthday: 1104129000, id: 5, git: "github.com/olgasmirnova", email: "smirnova.olga2005@gmail.com")
student6 = Student.new(surname: "Кузнецов", name: "Дмитрий", fathername: "Андреевич", birthday: 1055789400, id: 6, git: "github.com/dmitrykuznetsov", email: "kuznetsov.dmitry2004@gmail.com")

test = Data_list_student_short.new([
  StudentShort.new(id:1, fio:"Ivanov I. I.", contact:"ivanov227@gmail.com",  git:"github.com/ivanov"),
  StudentShort.new(id:2, fio:"Petrov P. P.", contact:"@test_tgk",  git:"github.com/wsed4"),
  StudentShort.new(id:3, fio:"Sidorov S. S.", contact:"89320509129",  git:"github.com/dhy49")
])
test.select(0)
test.select(1)
test.select(2)
puts test.get_data().row_count()
puts test.get_data().get_element(0, 2) 
test.get_selected.each { |item| puts item.to_s }
# list = Student_list_JSON.new('students.json')
# list.add_student(student1)
# list.add_student(student2)
# list.add_student(student3)
# list.add_student(student4)
# list.write_list_to_file
# student = list.get_student_by_id(3)
# puts student.inspect
# puts list.sort_by_surname_and_initials
# puts list.get_student_short_count
# puts list.replace_student(4, student6)
# list.write_list_to_file

# list = Student_list_JSON.new("students_example.json")
# list.read_list_from_file()
# puts list.get_student_by_id(13)
# puts list.get_student_short_count

# list = Student_list_YAML.new('students_example.yaml')
# list.read_list_from_file()
# puts list.get_student_by_id(5)
# puts list.get_student_short_count

# list = Student_list_YAML.new('students.yaml')
# list.add_student(student1)
# list.add_student(student2)
# list.add_student(student3)
# list.add_student(student4)
# list.write_list_to_file
# puts list.get_student_by_id(3)

# json_list = Student_list_file_base.new("./Resourses/students_example.json", Strategy_JSON.new())
# json_list.read_list_from_file()
# puts json_list.get_student_by_id(5)
# puts json_list.get_student_short_count

# db = Student_list_DB.new
# db.client.exec("select * from students;").each { |row| puts row }
# puts db.get_student_short_count