require_relative './data_list.rb'
require_relative '../data_table/data_table.rb'

class Data_list_student_short < Data_list
  def initialize(list)
    super(list)
  end

  def get_names
    ['id','fio', 'contact', 'git']
  end

  def to_list
    @list
  end

  private
  def make_from_attributes(index)
    return [index, @list[index].fio, @list[index].contact, @list[index].git]
  end
end