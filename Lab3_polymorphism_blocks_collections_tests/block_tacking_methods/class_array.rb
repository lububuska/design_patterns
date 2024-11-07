class ArrayMethods
  def initialize(array)
    @array = array
  end

  def [](index)
    return @array[index]
  end

  def count
    count = 0
    self.array.each do |element|
      count += 1 if yield(element)
    end
    return count
  end

  def filter_map
    result = []
    self.array.each do |element|
      value = yield(element)
      result.push(value) if value
    end
    return result
  end

  def group_by
    result = {}
    self.array.each do |element|
      key = yield(element)
      result[key] = result.fetch(key, [])
      result[key] << element
    end
    return result
  end

  
  def min
    if self.array.nil? or self.array.empty? 
      return nil
    end
    minimal = self.array[0]
    self.array.each do |element|
      minimal = element if yield(element, minimal) < 0
    end
    return minimal
  end 

  def partition
    array = []
    part_if_true = []
    part_if_false = []
    self.array.each do |element|
      if yield(element) == true
        part_if_true.push(element)
      else
        part_if_false.push(element)
      end
    end
    array.push(part_if_true)
    array.push(part_if_false)
    return array
  end

  private
  attr_accessor :array
end


# array = ArrayMethods.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
# result = array.partition{|x| (x % 3).zero?}
# print(result)