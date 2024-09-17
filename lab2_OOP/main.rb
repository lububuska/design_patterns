require './objects_and_classes.rb'
student1 = Student.new("Masenko", "Maria", "Sergeevna", 1, 89324000874, "lububuska", "masenko.maria2004@gmail.com", "lububuska")
student2 = Student.new("Anikin", "Mark", "Andreevich", 2, 89324897619, "corray9", "mark.corray.off@gmail.com", "Corray333")
student3 = Student.new("Ivanov", "Ivan", "Ivanovich", 3, 89184567210, "ivan", "ivanTheBest@mail.ru", "ivan")

student1.show_information()
student2.show_information()
student3.show_information()