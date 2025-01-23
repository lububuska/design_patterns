require_relative '../view/student_list_view.rb'
require_relative '../model/student_list_strategy/student_list_file_base.rb'

class Students_list_controller
  attr_reader :student_list
  def initialize(view)
    @view = view
    begin
        @students_list = Student_list_file_base.new('../resources/data/students_example.json', Strategy_JSON.new())
        @data_list = Data_list_student_short.new([])
        @data_list.add_observer(@view)
    rescue StandardError => e
        @view.show_error_message("Ошибка при доступе к данным: #{e.message}")
    end
  end

  def refresh_data
    @students_list.get_k_n_student_short_list(@view.current_page, @view.items_per_page, @data_list)
    @data_list.notify
  end

  def count_elements()
    return @students_list.count()
  end

  def sort_table_by_column(data, sort_order, col_idx)
    #
  end

  def create
      puts "Создание записи"
  end

  def update(number)
      return if number.nil?
      puts "Изменение строки с номером: #{number}"
  end

  def delete(number)
      return if number.nil?
      puts "Удаление строк с номерами #{number}"
  end

  private
  attr_accessor :view, :students_list, :data_list
end