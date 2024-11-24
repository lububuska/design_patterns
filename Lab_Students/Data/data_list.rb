class Data_list
  def initialize(list)
    raise ArgumentError, "Data must be an array" unless list.is_a?(Array)
    @list = list.freeze
    @selected_ids = []
  end

  #Выделить элемент по номеру
  def select(index)
    raise "Index is out of range" unless index.is_a?(Integer) && index.between?(0, @list.size)
    @selected_ids.append(index) unless @selected_ids.include?(index)
    return @list[index]
  end

  #Получить массив id выделенных элементов
  def get_selected
    @selected_ids
  end

  def get_names
  end

  def get_data
  end

  private
  attr_accessor :list, :selected_ids  
end