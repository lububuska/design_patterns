class Data_list
  def initialize(list)
    raise ArgumentError, "Data must be an array" unless list.is_a?(Array)
    @list = list.freeze
    @selected_ids = []
    @index = 0
  end

  #Выделить элемент по номеру
  def select(index)
    raise "Index is out of range" unless index.is_a?(Integer) && index.between?(0, @list.size-1)
    @selected_ids.append(index) unless @selected_ids.include?(index)
    return @list[index]
  end

  #Получить массив id выделенных элементов
  def get_selected
    @selected_ids
  end

  def get_names
    raise NotImplementedError, "Method get_names is not implemented!"
  end

  def get_data
    data_in_table = []
    selected = self.get_selected
    selected.each do |selected_ids|
      object = self.list[selected_ids]
      row = [index + 1, object.fio, object.contact, object.git]
      data_in_table.append(row)
    end
    return Data_table.new(data_in_table)
  end

  def list=(list)
    raise ArgumentError, "Data must be an array" unless list.is_a?(Array)
    @list = list.freeze
  end

  protected
  attr_accessor :selected_ids, :index
  attr_reader :list
  def make_from_attributes #Этот метод надо реализовать в дочернем классе
    raise NotImplementedError, "Method get_names is not implemented!"
  end
end