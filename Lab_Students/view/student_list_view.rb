require 'fox16'
require_relative "../model/DB/student_list_DB.rb"
require_relative "../model/student_list_strategy/student_list_file_base.rb"
require_relative "../model/student_list_strategy/strategy_JSON.rb"
require_relative "../model/student_list_strategy/strategy_YAML.rb"
require_relative '../controller/student_list_controller.rb'
include Fox

class Student_list_view < FXMainWindow

  def initialize(app)
    super(app, "Student List", width: 1300, height: 524)
    @filters = {}
    @current_page = 1
    @items_per_page = 20
    @total_pages = 0

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

    @controller = Students_list_controller.new(self)
    refresh_data
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
      @table.setTableSize(@items_per_page, 4)
      @table.setColumnWidth(0, 30)
      (1...4).each { |col| @table.setColumnWidth(col, 270) }
      @table.rowHeaderWidth = 0
      @table.columnHeaderHeight = 0
      @table.connect(SEL_COMMAND) do |_, _, pos|
        if pos.row == 0
          sort_table_by_column(pos.col)
          update
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
    refresh_button.connect(SEL_COMMAND) { refresh_data }
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
    return if new_page < 1 || new_page > @total_pages
    @current_page = new_page
    @controller.refresh_data
  end

  def set_table_data(input_data_table)
    clear_table
    (0...input_data_table.row_count).each do |row|
      (0...input_data_table.col_count).each do |col|
          @table.setItemText(row, col, input_data_table.get_element(row, col).to_s)
      end
    end
  end

  def set_table_params(column_names)
    column_names.each_with_index do |name, index|
        @table.setItemText(0, index, name)
    end
    @total_pages = (@controller.count_elements() / self.items_per_page.to_f).ceil
    @page_label.text = "Страница #{self.current_page} из #{self.total_pages}"
  end

  def refresh_data
    @current_page = 1
    @controller.refresh_data
  end

  def sort_table_by_column(col_idx=0)
    return if @data.nil? || @data.row_count <= 1
    @data, @sort_order = @controller.sort_table_by_column(@data, @sort_order, col_idx)
  end

  def create
      super
      show(PLACEMENT_SCREEN)
  end

  attr_accessor :current_page, :items_per_page

  private

  attr_accessor :filters, :table, :prev_button, :next_button, :page_label, :sort_order, :selected_rows, :edit_button, :delete_button, :controller, :total_pages

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
    refresh_data
  end

  def clear_table
    (0...@table.numRows).each do |row|
        (0...@table.numColumns).each do |col|
            @table.setItemText(row, col, "")
        end
    end
  end

  def add_entry
    @controller.create
  end

  def edit_entry
    @selected_rows = []
    (0...@table.numRows).each do |row_idx|
        @selected_rows << row_idx if @table.rowSelected?(row_idx)
    end
    @controller.update(@selected_rows.first)
  end
  def delete_entries
    @selected_rows = []
    (0...@table.numRows).each do |row_idx|
        @selected_rows << row_idx if @table.rowSelected?(row_idx)
    end
    @controller.delete(@selected_rows)
  end
end