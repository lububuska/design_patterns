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