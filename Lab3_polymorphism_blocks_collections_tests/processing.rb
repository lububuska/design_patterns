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