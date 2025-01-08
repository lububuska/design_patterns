class Data_table
  def initialize(data)
    @data = data
  end

  def row_count
    return @data.size
  end

  def col_count
    if @data.empty?
      return 0
    end
  end

  def get_element(row, col)
    if row >= 0 && row < @data.size && col >= 0 && col < @data[row].size
      return @data[row][col]
    else
      raise ArgumentError, "Index if out of range"
    end
  end

  private 
  attr_reader :data
end