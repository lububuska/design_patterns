require 'fox16'
require "../DB/student_list_DB.rb"
require "../Student_list_strategy/student_list_file_base.rb"
require "../Student_list_strategy/strategy_JSON.rb"
require "../Student_list_strategy/strategy_YAML.rb"
include Fox

class Student_list_view < FXMainWindow

  def initialize(app, students_list)
      super(app, "Student List", width: 1000, height: 524)
      @filters = {}
      @students_list = students_list
      @current_page = 1
      @items_per_page = 21

      main_frame = FXHorizontalFrame.new(self, LAYOUT_FILL_X | LAYOUT_FILL_Y)
      main_frame.backColor = FXRGB(97, 225, 187)

      filter_frame = FXVerticalFrame.new(main_frame, LAYOUT_FIX_WIDTH, width: 200, padding: 10)
      set_filter_parameters(filter_frame)
      filter_frame.backColor = FXRGB(215, 178, 236)

      table_frame = FXVerticalFrame.new(main_frame, LAYOUT_FILL_X | LAYOUT_FILL_Y, padding: 10)
      set_table_parameters(table_frame)
      table_frame.backColor = FXRGB(215, 178, 236)

      control_frame = FXVerticalFrame.new(main_frame, LAYOUT_FIX_WIDTH, width: 180, padding: 10)
      set_сontrol_parameters(control_frame)
      control_frame.backColor = FXRGB(215, 178, 236)

      load_data_students
      update_table
  end

  def set_filter_parameters(parent)
    label = FXLabel.new(parent, "ФИЛЬТРАЦИЯ", opts: LAYOUT_FILL_X)
    label.backColor = FXRGB(215, 178, 236)
    fio = FXLabel.new(parent, "Фамилия и инициалы:")
    fio.backColor = FXRGB(215, 178, 236)
    name_text_field = FXTextField.new(parent, 25, opts: TEXTFIELD_NORMAL)
    
    @filters['name'] = { text_field: name_text_field }

    git = add_filtering_row(parent, "Git:", FXRGB(215, 178, 236))
    email = add_filtering_row(parent, "Email:", FXRGB(215, 178, 236))
    tel = add_filtering_row(parent, "Телефон:", FXRGB(215, 178, 236))
    tg = add_filtering_row(parent, "Telegram:", FXRGB(215, 178, 236))

    FXButton.new(parent, "Сбросить", opts: BUTTON_NORMAL).connect(SEL_COMMAND) do
      reset_filters
    end
  end

  def add_filtering_row(parent, label, color)
    FXLabel.new(parent, label)

    button_frame = FXHorizontalFrame.new(parent, opts: LAYOUT_FILL_X)
    button_frame.backColor = FXRGB(215, 178, 236)
    radio_button1 = FXRadioButton.new(button_frame, "Не важно")
    radio_button2 = FXRadioButton.new(button_frame, "Да")
    radio_button3 = FXRadioButton.new(button_frame, "Нет")
    radio_button1.backColor = FXRGB(172, 142, 189)
    radio_button2.backColor = FXRGB(172, 142, 189)
    radio_button3.backColor = FXRGB(172, 142, 189)
    text_field = FXTextField.new(parent, 25, opts: TEXTFIELD_NORMAL)
    text_field.enabled = false

    @filters[label] = { 
      radio_button1: radio_button1, 
      radio_button2: radio_button2, 
      radio_button3: radio_button3,
      selected: "Не важно",
      text_field: text_field
    }
    radio_button1.check = true

    radio_button1.connect(SEL_COMMAND) { handle_radio_button_selection(label, radio_button1, "Не важно", text_field) }
    radio_button2.connect(SEL_COMMAND) { handle_radio_button_selection(label, radio_button2, "Да", text_field) }
    radio_button3.connect(SEL_COMMAND) { handle_radio_button_selection(label, radio_button3, "Нет", text_field) }
  end

  def handle_radio_button_selection(label, selected_button, value, text_field)
    if @filters[label][:selected] == value
      selected_button.check = false
      @filters[label][:selected] = nil
    else
      @filters[label].each { |key, button| button.check = false unless key == :selected || key == :text_field }
      selected_button.check = true
      @filters[label][:selected] = value
    end
    text_field.enabled = value == "Да"
  end

  def set_table_parameters(parent)
      @table = FXTable.new(parent, opts: LAYOUT_FILL_X | LAYOUT_FILL_Y | TABLE_READONLY | TABLE_COL_SIZABLE)
      @table.setTableSize(@items_per_page, 3)
      @table.defColumnWidth = 180
      @table.rowHeaderWidth = 0
      @table.columnHeaderHeight = 0
      @table.connect(SEL_COMMAND) do |_, _, pos|
        if pos.row == 0
            sort_table_by_column
        end
        if pos.col == 0
            @table.selectRow(pos.row)
        end
        update_buttons_state
      end

      nav_frame = FXHorizontalFrame.new(parent, opts: LAYOUT_FILL_X)
      nav_frame.backColor = FXRGB(215, 178, 236)
      @prev_button = FXButton.new(nav_frame, "Пред.", opts: BUTTON_NORMAL | LAYOUT_LEFT)
      @prev_button.backColor = FXRGB(215, 178, 236)
      @next_button = FXButton.new(nav_frame, "След.", opts: BUTTON_NORMAL | LAYOUT_RIGHT)
      @next_button.backColor = FXRGB(215, 178, 236)
      @page_label = FXLabel.new(nav_frame, "Страница 1", opts: LAYOUT_CENTER_X)
      @page_label.backColor = FXRGB(215, 178, 236)
      @prev_button.connect(SEL_COMMAND) { change_page(-1) }
      @next_button.connect(SEL_COMMAND) { change_page(1) }

  end

  def set_сontrol_parameters(parent)
    label = FXLabel.new(parent, "УПРАВЛЕНИЕ", opts: LAYOUT_FILL_X)
    label.backColor = FXRGB(215, 178, 236)
    control_frame = FXVerticalFrame.new(parent, opts: LAYOUT_FILL_X)
    control_frame.backColor = FXRGB(215, 178, 236)

    add_button = FXButton.new(parent, "Добавить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
    add_button.connect(SEL_COMMAND) { add_entry }
    add_button.backColor = FXRGB(172, 142, 189)
    @delete_button = FXButton.new(parent, "Удалить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
    @delete_button.connect(SEL_COMMAND) { delete_entries }
    @delete_button.backColor = FXRGB(172, 142, 189)
    @edit_button = FXButton.new(parent, "Изменить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
    @edit_button.connect(SEL_COMMAND) { edit_entry }
    @edit_button.backColor = FXRGB(172, 142, 189)
    refresh_button = FXButton.new(parent, "Обновить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
    refresh_button.connect(SEL_COMMAND) { update_table }
    refresh_button.backColor = FXRGB(172, 142, 189)
    @table.connect(SEL_CHANGED) do
      update_buttons_state
    end
    update_buttons_state
  end
  def update_buttons_state
    selected_rows = (0...self.table.numRows).select { |row| self.table.rowSelected?(row) }
    self.delete_button.enabled = !selected_rows.empty?
    self.edit_button.enabled = (selected_rows.size == 1)
  end

  def change_page(offset)
    new_page = @current_page + offset
    total_pages = (@students_list.get_student_short_count.to_f / @items_per_page).ceil
    @current_page = new_page if new_page.between?(1, total_pages)
    update_table
  end

  def update_table
    return if data.nil? || data.row_count <= 1

    total_pages = (data.row_count.to_f / items_per_page).ceil
    page_label.text = "#{current_page} страница из #{total_pages}"

    start_idx, end_idx = [(current_page - 1) * items_per_page, data.row_count - 1]
    end_idx = [start_idx + items_per_page - 1, end_idx].min

    data_for_page = (start_idx..end_idx).map { |row_idx| (0...data.column_count).map { |col_idx| data.get_element(row_idx, col_idx) } }

    table.setTableSize(data_for_page.length, data.column_count)
    table.setColumnWidth(0, 30)

    data_for_page.each_with_index do |row, row_idx|
      row.each_with_index { |value, col_idx| table.setItemText(row_idx, col_idx, value.to_s) }
    end
  end

  def load_data_students
      @data = @students_list.get_k_n_student_short_list(1, @students_list.get_student_short_count).get_data
  end

  def sort_table_by_column(col_idx=0)
    return if @data.nil? || @data.row_count <= 1

    rows = (1...@data.row_count).map do |row_idx|
      (0...@data.column_count).map { |col_idx| @data.get_element(row_idx, col_idx) }
    end

    @sort_order = !@sort_order

    sorted_rows = rows.sort_by { |row| row[1]}
    sorted_rows.reverse! unless @sort_order

    headers = (0...@data.column_count).map { |col_idx| @data.get_element(0, col_idx) }
    @data = DataTable.new([headers] + sorted_rows)

    update_table
  end

  def create
      super
      show(PLACEMENT_SCREEN)
  end

  private

  attr_accessor :filters, :students_list, :current_page, :items_per_page, :table, :prev_button, :next_button, :page_label, :sort_order, :data, :selected_rows, :edit_button, :delete_button

  def reset_filters
    @filters.each do |label, filter|
        if filter[:radio_button1] && filter[:radio_button2] && filter[:radio_button3]
          filter[:radio_button1].check = true
          filter[:radio_button2].check = false
          filter[:radio_button3].check = false
        end
        filter[:selected] = "Не важно"
        if label != 'name' 
          filter[:text_field].enabled = false
        end
        filter[:text_field].setText("")
    end
  end
  def add_entry
    # Какая-то логика
  end
  def edit_entry
    @selected_rows = []
    (0...@table.numRows).each do |row_idx|
        @selected_rows << row_idx if @table.rowSelected?(row_idx)
    end
    puts "Изменение строки с номером: #{@selected_rows.first}"
  end
  def delete_entries
    @selected_rows = []
    (0...@table.numRows).each do |row_idx|
        @selected_rows << row_idx if @table.rowSelected?(row_idx)
    end
    puts "Удаление строк с номерами: #{@selected_rows}"
  end
end