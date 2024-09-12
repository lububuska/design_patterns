# Написать методы, которые находят минимальный, элементы, номер первого положительного элемента. Каждая операция в отдельном методе. Решить задачу с помощью циклов(for и while).

# Нахождение минимального элемента в массиве
def minimal_element(array)
  if array.size == 0 
    return nil
  end
  minimal = array[0]
  for index in 1...array.size
    if array[index] < minimal 
      minimal = array[index]
    end
  end
  return minimal
end

# Нахождение номера первого положительного элемента

def first_positive_element(array)
  if array.size == 0 
    return nil
  end
  for index in 0...array.size
    if array[index] > 0
      return index
    end
  end
  return nil
end

def read_array_from_file(file)
  array = []
  begin
    File.open(file, 'r') do |file|
      file.each_line do |line|
        line.split(", ").each do |number|
          array.push(number.to_i)
        end
      end
    end
  rescue 
    puts "Введите существующий файл!"
    exit -1
  end
  return array
end

# Написать программу, которая принимает как аргумент два значения. Первое значение говорит, какой из методов задачи 1 выполнить, второй говорит о том, откуда читать список аргументом должен быть написан адрес файла. Далее необходимо прочитать массив и выполнить метод.

if ARGV.size == 2
  method = ARGV[0].to_i
  file = ARGV[1]
  array = read_array_from_file(file)
  if method == 1
    puts "Минимальный элемент: #{minimal_element(array)}"
  elsif method == 2
    puts "Номер первого положительного элемента: #{first_positive_element(array)}"
  else puts "Ошибка, введите номер 1 или 2!"
  end
else puts "Введите все аргументы программы!"
end