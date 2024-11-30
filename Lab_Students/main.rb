require './class_student.rb'
require './short_class_student.rb'
require './Tree/binary_tree.rb'

student1 = Student.new(surname: "Масенко", name: "Мария", fathername: "Сергеевна", birthday: 1076532600, id: 1, git: "github.com/lububuska", email: "masenko.maria2004@gmail.com")
student2 = Student.new(surname: "Аникин", name: "Марк", fathername: "Андреевич", birthday: 1034455800, id: 2, git: "github.com/Corray333")
student3 = Student.new(surname: "Иванов", name: "Иван", fathername: "Иванович", birthday: 946759800, id: 3, email: "ivanTheBest@mail.ru", git: "github.com/ivanTheBest")

student2.set_contacts(tel: "+79320509129")

tree = Binary_tree.new()
tree.add_node(student1)
tree.add_node(student2)
tree.add_node(student3)

tree.each{|x| puts x}
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