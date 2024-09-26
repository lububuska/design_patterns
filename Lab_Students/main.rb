require './objects_and_classes.rb'
student1 = Student.new({surname: "Masenko", name: "Maria", fathername: "Sergeevna", id: 1, tg: "lububuska", email: "masenko.maria2004@gmail.com", git: "github.com/lububuska"})
student2 = Student.new({surname: "Anikin", name: "Mark", fathername: "Andreevich", id: 2, tel: "324897619", tg: "corray9", email: "mark.corray.off@gmail.com", git: "github.com/Corray333"})
student3 = Student.new({surname: "Ivanov", name: "Ivan", fathername: "Ivanovich", id: 3, tel: "89184567210", tg: "ivan", email: "ivanTheBest@mail.ru"})

student1.to_s()
student2.to_s()
student3.to_s()