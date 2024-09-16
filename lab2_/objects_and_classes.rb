class Student
  def initialize(id = nil, surname, name, fathername, tel = nil, tg = nil, email = nil, git = nil)
    @id = id
    @surname = surname
    @name = name
    @fathername = fathername
    @tel = tel
    @tg = tg
    @email = email
    @git = git
  end
  def get_id
    @id
  end
  def set_id
    @id = id 
  end
  def get_surname
    @surname
  end
  def set_surname
    @surname = surname
  end
  def get_name
    @name
  end
  def set_name
    @name = name
  end
  def get_fathername
    @fathername
  end
  def set_fathername
    @fathername = fathername
  end
  def get_tel
    @tel
  end
  def set_tel
    @tel = tel
  end
  def get_tg
    @tg
  end
  def set_tg
    @tg = tg
  end
  def get_email
    @email
  end
  def set_email
    @email = email
  end
  def get_git
    @git
  end
  def set_git
    @git = git
  end
end
