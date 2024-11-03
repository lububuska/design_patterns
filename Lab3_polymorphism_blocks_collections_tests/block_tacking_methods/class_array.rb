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

  private
  attr_accessor :array
end