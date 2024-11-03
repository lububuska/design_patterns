# Задача 1.10 Даны два массива. Необходимо найти количество совпадающих по значению элементов.
def find_same_elements(array1, array2)
  same_elements_count = (array1 & array2).size
  return same_elements_count
end

# Задача 1.22	Дан целочисленный массив и интервал a..b. Необходимо найти количество минимальных элементов в этом интервале.
def find_amount_of_minimal_elements(array, a, b)
  minimal_element = array.min
  amount = array[a...b].count(minimal_element)
  return amount
end

# 1.34	Дан целочисленный массив и отрезок a..b. Необходимо найти элементы, значение которых принадлежит этому отрезку.
def elements_from_segment(array, a, b)
  numbers = array.select{|x| x > a && x < b}
  return numbers
end

# 1.46	Дан целочисленный массив. Необходимо вывести вначале его положительные элементы, а затем - отрицательные.

def neg_and_pos_numbers(array)
  negative = array.select{|x| x < 0}
  positive = array.select{|x| x > 0}
  return positive + negative
end

# 1.58 Для введенного списка вывести количество элементов, которые могут быть получены как сумма двух любых других элементов списка.

def sum_of_two_numbers(list)
  sums = list.combination(2).map{|x, y| x + y}
  return (list & sums).size
end

print(sum_of_two_numbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))