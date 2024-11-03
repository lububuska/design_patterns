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

  private
  attr_accessor :array
end