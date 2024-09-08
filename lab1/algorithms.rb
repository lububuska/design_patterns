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
