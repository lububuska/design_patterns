require './objects_and_classes.rb'
student1 = Student.new(surname: "Masenko", name: "Maria", fathername: "Sergeevna", id: 1, tel: 89324000874, tg: "lububuska", email: "masenko.maria2004@gmail.com", git: "lububuska")
student2 = Student.new(surname: "Anikin", name: "Mark", fathername: "Andreevich", id: 2, tel: 89324897619, tg: "corray9", email: "mark.corray.off@gmail.com", git: "Corray333")
student3 = Student.new(surname: "Ivanov", name: "Ivan", fathername: "Ivanovich", id: 3, tel: 89184567210, tg: "ivan", email: "ivanTheBest@mail.ru", git: "ivan")

student1.show_information()
student2.show_information()
student3.show_information()