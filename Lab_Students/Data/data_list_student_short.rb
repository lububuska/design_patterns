require_relative 'data_list.rb'
require_relative 'data_table.rb'

class Data_list_student_short < Data_list

  def get_data
    data_in_table = []
    selected = self.get_selected
    selected.each do |selected_ids|
      object = self.list[selected_ids]
      [index + 1, object.fio, object.git, object.contact]
      result_data.append(data_in_table)
    end
    return Data_table.new(data_in_table)
  end

  def get_names
    ['fio', 'git', 'contact']
  end

end