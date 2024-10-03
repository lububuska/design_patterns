require './class_student.rb'
require './short_class_student.rb'

student1 = Student.new(surname: "Масенко", name: "Мария", fathername: "Сергеевна", id: 1)
student1.set_contacts(tg: "@lububuska", email: "masenko.maria2004@gmail.com", git: "github.com/lububuska")
student2 = Student.new(surname: "Аникин", name: "Марк", fathername: "Андреевич", id: 2)
student2.set_contacts(tel: "89324897619", git: "github.com/Corray333")
student3 = Student.new(surname: "Иванов", name: "Иван", fathername: "Иванович", id: 3)
student3.set_contacts(email: "ivanTheBest@mail.ru", git: "github.com/ivanTheBest")

student1.to_s()
student2.to_s()
student3.to_s()

puts student1.get_info()
puts student2.get_info()
puts student3.get_info()

short_student1_class = StudentShort.from_student(student1)
short_student1_class.to_s()
short_student1_string = StudentShort.from_string(id: 1, string: student1.get_info())
short_student1_string.to_s()