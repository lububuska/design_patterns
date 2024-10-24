# Задача 1.10 Даны два массива. Необходимо найти количество совпадающих по значению элементов.
def find_same_elements(array1, array2)
  same_elements_count = (array1 & array2).size
  return same_elements_count
end

# Задача 1.22	Дан целочисленный массив и интервал a..b. Необходимо найти количество минимальных элементов в этом интервале.
def find_amount_of_minimal_elements(array, a, b)
  minimal_element = array.min
  puts minimal_element
  amount = array[a..b].count(minimal_element)
  return amount
end