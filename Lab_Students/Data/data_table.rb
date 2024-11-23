class Data_table
  def initialize(data)
    @data = data
  end

  def row_count
    return data.size
  end

  def col_count
    if data.empty?
      return 0
    end
    return self.data[0].size
  end

  def get_element(row, col)
    if row >= 0 && row < data.size-1 && col >= 0 && col < data[row].size-1
      return self.data[row][col]
    else
      raise ArgumentError, "Index if out of range"
    end
  end

  private 
  attr_reader :data

  def data=(data)
    if data.is_a?(Array) && data.all? {|row| row.is_a?(Array)}
      @data = data
    else
      raise ArgumentError, "Data must be a 2-dimensional array"
    end
  end
end