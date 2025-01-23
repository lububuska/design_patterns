class Data_list

  attr_accessor :index

  def initialize(list)
    @list = list
    @selected_ids = []
    @observers = []
    @count = 0
    @index = 0
  end

  #Выделить элемент по номеру
  def select(index)
    raise ArgumentError, "Index is out of range" unless index.is_a?(Integer) && index.between?(0, @list.size-1)
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
    @list.each do |k,v|
      row = self.make_from_attributes(k)
      data_in_table.append(row)
    end
    return Data_table.new(data_in_table)
  end

  def list=(list)
    @list = {}
    list.each do |el|
      @list[self.index] = el
      self.index = self.index + 1
    end
  end

  def notify
    return if observers.nil?
    observers.each do |observer|
      observer.set_table_params(self.get_names)
      observer.set_table_data(self.get_data)
    end
  end
  def add_observer(observer)
      @observers << observer
  end

  attr_accessor :count

  private
  attr_accessor :selected_ids, :observers
  attr_reader :list
  def make_from_attributes #Этот метод надо реализовать в дочернем классе
    raise NotImplementedError, "Method get_names is not implemented!"
  end
end