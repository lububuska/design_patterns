class Strategy
  def read_list_from_file(file_path, students)
    raise NotImplementedError, "Method read_list_from_file must be implemented in children class!"
  end

  def write_list_to_file(file_path, students)
    raise NotImplementedError, "Method write_list_to_file must be implemented in children class!"
  end
end
