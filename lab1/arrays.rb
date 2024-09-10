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

puts minimal_element([15, 8, 10, 55, 32, 6])

# Нахождение первого положительного элемента

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

puts first_positive_element([-3, -5, -8, -1, -9])