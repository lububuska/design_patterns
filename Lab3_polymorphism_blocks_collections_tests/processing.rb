# Задача 1.10 Даны два массива. Необходимо найти количество совпадающих по значению элементов.
def find_same_elements(array1, array2)
  same_elements_count = (array1 & array2).size
  return same_elements_count
end