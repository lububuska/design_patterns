class Array_methods
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
  end 

  private
  attr_accessor :array
end