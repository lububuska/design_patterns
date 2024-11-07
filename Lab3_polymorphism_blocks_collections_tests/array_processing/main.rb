require "./processing.rb"

def from_file
  puts "Введите путь до файла"
  puts "\n"
  path = gets.chomp
  if path.nil? || path.empty? then 
    raise ArgumentError, "Пусть до файла пуст или не существует"
  end
  array = []
  File.open(path, 'r') do |file|
    array = file.split(' ').map{|x| x.to_i}
  end
  return array
end

def from_console
  puts "Введите массив (элементы вводятся через пробел)"
  puts "\n"
  array = gets.chomp.split.map{|x| x.to_i}
  return array
end


def menu_from
  array = []
  loop do
    puts "Выберите способ ввода данных: "
    puts "1. С клавиатуры"
    puts "2. Из файла"
    puts "\n"

    option = gets.chomp.to_i
    case option
    when 1
      array = from_console()
      break
    when 2
      array = from_file()
      break
    else
      puts "Некорректный ввод"
    end
  end
  return array
end

def first_task
  arr1 = menu_from()
  arr2 = menu_from()
  result = find_same_elements(arr1, arr2)
  return result
end

def second_task
  arr = menu_from()
  puts "Введите начало интервала"
  a = gets.chomp.to_i
  puts "Введите конец интервала"
  b = gets.chomp.to_i
  result = find_amount_of_minimal_elements(arr, a, b)
  return result
end

def third_task
  arr = menu_from()
  puts "Введите начало отрезка"
  a = gets.chomp.to_i
  puts "Введите конец отрезка"
  b = gets.chomp.to_i
  result = elements_from_segment(arr, a, b)
  return result
end

def fourth_task
  arr = menu_from()
  result = neg_and_pos_numbers(arr)
  return result
end

def fifth_task
  list = menu_from()
  result = sum_of_two_numbers(list)
  return result
end

def menu
  loop do
    puts "Выберите задачу"
    puts "1. Даны два массива. Необходимо найти количество совпадающих по значению элементов."
    puts "2. Дан целочисленный массив и интервал a..b. Необходимо найти количество минимальных элементов в этом интервале."
    puts "3. Дан целочисленный массив и отрезок a..b. Необходимо найти элементы, значение которых принадлежит этому отрезку."
    puts "4. Дан целочисленный массив. Необходимо вывести вначале его положительные элементы, а затем - отрицательные."
    puts "5. Для введенного списка вывести количество элементов, которые могут быть получены как сумма двух любых других элементов списка."
    
    puts "\n"
    option = gets.chomp.to_i

    case option
    when 1
      print first_task()
      puts "\n"
    when 2
      print second_task()
      puts "\n"
    when 3
      print third_task()
      puts "\n"
    when 4
      print fourth_task()
      puts "\n"
    when 5
      print fifth_task()
      puts "\n"
    else
      puts "Задачи с номером #{option} не существует!"
      break
    end
  end
end

menu()
