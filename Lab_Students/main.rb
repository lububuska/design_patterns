require './objects_and_classes.rb'
student1 = Student.new(surname: "Масенко", name: "Мария", fathername: "Сергеевна", id: 1, tg: "@lububuska", email: "masenko.maria2004@gmail.com", git: "github.com/lububuska")
student2 = Student.new(surname: "Аникин", name: "Марк", fathername: "Андреевич", id: 2, tel: "89324897619", tg: "@corray9", email: "mark.corray.off@gmail.com", git: "github.com/Corray333")
student3 = Student.new(surname: "Иванов", name: "Иван", fathername: "Иванович", id: 3, tel: "89184567210", tg: "@iivan", email: "ivanTheBest@mail.ru")

student1.to_s()
student2.to_s()
student3.to_s()