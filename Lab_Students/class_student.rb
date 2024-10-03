class Student
  attr_reader :surname, :name, :fathername, :tel, :tg, :email, :git, :id 

  def initialize(surname:, name:, fathername:, id: nil, tel: nil, tg: nil, email: nil, git: nil)
    
    self.surname = surname.nil? || surname.empty? ? (raise "You didn't enter surname") : surname
    self.name = name.nil? || name.empty? ? (raise "You didn't enter name") : name
    self.fathername = fathername.nil? || fathername.empty? ? (raise "You didn't enter fathername") : fathername
 
    @id = id

  end

  # валидация полей

  def self.surname?(surname)
    /^[А-ЯЁ][а-яё]+(-[А-ЯЁ][а-яё]+)?$/.match?(surname)
  end

  def self.name?(name)
    /^[А-ЯЁ][а-яё]+$/.match?(name)
  end

  def self.fathername?(fathername)
    /^[А-ЯЁ][а-яё]+$/.match?(fathername)
  end

  def self.telephone_validation?(tel_phone)
    tel_phone.nil? || /^(\+?7|8)\d{10}$/.match?(tel_phone)
  end

  def self.telegram_validation?(telegram)
    telegram.nil? || /^@[a-zA-Z0-9_]{5,32}$/.match?(telegram)
  end

  def self.email_validation?(email)
    email.nil? || /^[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+$/.match?(email)
  end

  def self.git_validation?(git)
    git.nil? || /^(https:\/\/)?(www\.)?github.com\/[a-zA-Z0-9_-]+$/.match?(git)
  end

  def validate_git()
    if git.nil? 
      raise "Your git is empty!"
    end
  end

  def validate_contacts()
    if tg.nil? && email.nil? && tel.nil? 
      raise "Telegram, email or telephone number is empty!"
    end
  end

  def validate()
    validate_git()
    validate_contacts()
  end

  def set_contacts(tel: nil, tg: nil, email: nil, git: nil)
    if !self.class.telephone_validation?(tel)
      raise "Your telephone number has invalid format!"
    else
      @tel = tel
    end
    if !self.class.telegram_validation?(tg)
      raise "Your telephone number has invalid format!"
    else
      @tg = tg
    end
    if !self.class.email_validation?(email)
      raise "Your telephone number has invalid format!"
    else
      @email = email
    end
    if !self.class.git_validation?(git)
      raise "Your telephone number has invalid format!"
    else
      @git = git
    end
    validate()
  end

  def to_s
    puts "-----------------"
    puts "#{@id}. #{@surname} #{@name} #{@fathername}" if @id
    puts "- #{@tel}" if @tel
    puts "- #{@tg}" if @tg
    puts "- #{@email}" if @email
    puts "- #{@git}" if @git
    puts "-----------------"
  end  

  def get_fio()
    "ФИО: #{surname} #{name[0]}. #{fathername[0]}."
  end

  def get_contacts()
    if tel then
      "telephone number: #{tel}"
    elsif tg then
      "telegram: #{tg}"
    elsif email then
      "email: #{email}"
    else 
      "contacts are not provided"
    end
  end

  def get_info()
    "#{get_fio}, git: #{get_git}, #{get_contacts}"
  end 

  def get_git()
    @git
  end

  private

  # сеттеры

  def surname=(surname)
    if !self.class.surname?(surname)
      raise "Your surname has invalid format!"
    end
    @surname = surname
  end

  def name=(name)
    if !self.class.name?(name)
      raise "Your name has invalid format!"
    end
    @name = name
  end

  def fathername=(fathername)
    if !self.class.fathername?(fathername)
      raise "Your fathername has invalid format!"
    end
    @fathername = fathername
  end
end
