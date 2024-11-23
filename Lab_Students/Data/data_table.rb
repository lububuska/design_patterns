class Data_table
  def initialize(data)
    @data = data
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