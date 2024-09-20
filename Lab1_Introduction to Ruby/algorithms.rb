# Вариант 11.
# Метод 1. Найти количество делителей числа, не делящихся на 3

def amount_of_dividers(number)
  count = 0
  for divider in 1..number
    if number % divider == 0 && divider % 3 != 0
      count += 1
    end
  end
  return count
end

puts amount_of_dividers(12) 

# Метод 2. Найти минимальную нечетную цифру числа.
def minimal_odd_digit(number)
  minimal_digit = 9
  while number > 0 do
    if number % 10 % 2 != 0 && number % 10 < minimal_digit
      minimal_digit = number % 10
    end
    number /= 10
  end
  return minimal_digit
end

puts minimal_odd_digit(26574)

# Метод 3. Найти сумму всех делителей числа, взаимно простых с суммой цифр числа и не взаимно простых с произведением цифр числа.

# Нахождение суммы и произведения цифр числа
def summa_and_comp_of_digits(number)
  summa_of_digits = 0
  comp_of_digits = 1
  while number > 0
    summa_of_digits += number % 10
    comp_of_digits *= number % 10
    number /= 10
  end
  return summa_of_digits, comp_of_digits
end

# Алгоритм Евклида для нахождения НОД
def nod(number_1, number_2)
  while number_2 != 0
    number_1, number_2 = number_2, number_1 % number_2
  end
  return number_1
end

# Окончательный поиск суммы делителей
def summa_of_dividers(number)
  summa = 0
  summa_of_digits, comp_of_digits = summa_and_comp_of_digits(number)
  for divider in 1..number
    if number % divider == 0 && nod(divider, summa_of_digits) == 1 && nod(divider, comp_of_digits) != 1
      summa += divider
    end
  end
  return summa
end

puts summa_of_dividers(16)