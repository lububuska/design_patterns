require './Entities/person.rb'

class Student < Person
  include Comparable
  attr_reader :surname, :name, :fathername, :tel, :tg, :email, :birthday

  def initialize(surname:, name:, fathername:, birthday:, id: nil, tel: nil, tg: nil, email: nil, git: nil)
    super(id: id, git: git)
    self.surname = surname.nil? || surname.empty? ? (raise "You didn't enter surname") : surname
    self.name = name.nil? || name.empty? ? (raise "You didn't enter name") : name
    self.fathername = fathername.nil? || fathername.empty? ? (raise "You didn't enter fathername") : fathername
    set_contacts(tel: tel, tg: tg, email: email, git: git)
    self.birthday = birthday
  end

  # сеттер для контактов

  def set_contacts(tel: nil, tg: nil, email: nil, git: nil)      
    if !tel.nil?
      if !self.class.is_telephone?(tel)
        raise "Your telephone number has invalid format!"
      else
        @tel = tel
      end
    end

    if !tg.nil?
      if !self.class.is_telegram?(tg)
        raise "Your telegram has invalid format!"
      else
        @tg = tg
      end
    end

    if !email.nil?
      if !self.class.is_email?(email)
        raise "Your email has invalid format!"
      else
        @email = email
      end
    end

    if !git.nil? 
      if !self.class.is_git?(git)
        raise "Your git has invalid format!"
      else
        @git = git
      end
    end
  end

  def to_s()
    result = ""
    result += "-----------------\n"
    result += "#{@id}. #{@surname} #{@name} #{@fathername}\n" if @id
    result += "- #{@tel}\n" if @tel
    result += "- #{@tg}\n" if @tg
    result += "- #{@email}\n" if @email
    result += "- #{@git}\n" if @git
    result += "-----------------\n"
  end  

  def to_h()
    {
      'id' => @id,
      'surname' => @surname,
      'name' => @name,
      'fathername' => @fathername,
      'birthday' => @birthday,
      'tel' => @tel,
      'tg' => @tg,
      'email' => @email,
      'git' => @git
    }
  end

  def get_fio()
    "ФИО: #{surname} #{name[0]}. #{fathername[0]}."
  end

  def contact()
    if @tel then
      "telephone number: #{@tel}"
    elsif @tg then
      "telegram: #{@tg}"
    elsif @email then
      "email: #{@email}"
    end
  end

  def get_info()
    "#{get_fio}, git: #{git}, #{contact}"
  end 

  def <=>(other)
    return nil unless other.is_a?(Student)
    birthday <=> other.birthday           
  end

  # сеттеры

  def birthday=(bd)
    @birthday = bd
  end

  def surname=(surname)
    if !self.class.is_surname?(surname)
      raise "Your surname has invalid format!"
    end
    @surname = surname
  end

  def name=(name)
    if !self.class.is_name?(name)
      raise "Your name has invalid format!"
    end
    @name = name
  end

  def fathername=(fathername)
    if !self.class.is_fathername?(fathername)
      raise "Your fathername has invalid format!"
    end
    @fathername = fathername
  end
end
