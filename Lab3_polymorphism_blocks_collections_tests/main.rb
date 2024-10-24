require "./processing.rb"

def from_file
  puts "Введите путь до файла"
  path = gets.chomp
  if path.nil? || path.empty? then 
    raise ArgumentError, "Пусть до файла пуст или не существует"
  end
  array1 = []
  array2 = []
  arrays = []
  File.open(file_path, 'r') do |file|
    file.each_line do |line|
      arrays += [line.chomp.split(' ').map{|x| x.to_i}] 
    end
  end
  array1 = [0]
  array2 = [1]
  return array1, array2
end

def from_console
  puts "Введите два массива через Enter (элементы вводятся через пробел)"
  array1 = gets.chomp.split.map{|x| x.to_i}
  array2 = gets.chomp.split.map{|x| x.to_i}
  return array1, array2
end


def menu
  loop do
    puts "Выберите способ ввода данных: "
    puts "1. С клавиатуры"
    puts "2. Из файла"

    option = gets.chomp.to_i
    case option
    when 1
      array1, array2 = from_console()
      break
    when 2
      array1, array2 = form_file()
      break
    else
      puts "Некорректный ввод"
    end
  end
end

menu
