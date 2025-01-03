require './class_student.rb'
require './short_class_student.rb'
require './Tree/binary_tree.rb'
require_relative 'Data/data_list_student_short.rb'
require_relative 'Data/data_list.rb'


student1 = Student.new(surname: "Масенко", name: "Мария", fathername: "Сергеевна", birthday: 1076532600, id: 1, git: "github.com/lububuska", email: "masenko.maria2004@gmail.com")
student2 = Student.new(surname: "Аникин", name: "Марк", fathername: "Андреевич", birthday: 1034455800, id: 2, git: "github.com/Corray333")
student3 = Student.new(surname: "Иванов", name: "Иван", fathername: "Иванович", birthday: 946759800, id: 3, email: "ivanTheBest@mail.ru", git: "github.com/ivanTheBest")

# student2.set_contacts(tel: "+79320509129")
test = Data_list_student_short.new([
  StudentShort.new(id:1, fio:"Ivanov I. I.", contact:"ivanov227@gmail.com",  git:"github.com/ivanov"),
  StudentShort.new(id:2, fio:"Petrov P. P.", contact:"@test_tgk",  git:"github.com/wsed4"),
  StudentShort.new(id:3, fio:"Sidorov S. S.", contact:"89320509129",  git:"github.com/dhy49")
])

test.to_array.each { |item| puts item.join(" ") }
new_test = Data_list_student_short.new([
  StudentShort.new(id: 4, fio: "Smirnov S. S.", contact: "smirnov@mail.com", git: "github.com/smirnov"),
  StudentShort.new(id: 5, fio: "Kuznetsov K. K.", contact: "@kuznetsov_tg", git: "github.com/kuznetsov")
])
test.list = new_test.to_list
test.to_array.each { |item| puts item.join(" ") }
# test.select(0)
# test.select(1)
# test.select(2)
# puts test.get_data().row_count()
# puts test.get_data().get_element(0, 2) 
# test.get_selected.each { |item| puts item.to_s }
# puts student1.to_s()
# puts student2.to_s()
# puts student3.to_s()

# puts student1.get_info()
# puts student2.get_info()
# puts student3.get_info()

# short_student1_class = StudentShort.from_student(student1)
# puts short_student1_class.to_s()
# short_student1_string = StudentShort.from_string(id: 1, string: student1.get_info())
# puts short_student1_string.to_s()