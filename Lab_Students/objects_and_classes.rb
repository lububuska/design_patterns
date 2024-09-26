class Student
  attr_accessor :surname, :name, :fathername, :id, :tg, :email, :git
  attr_reader :tel

  def initialize(parameters={})
    
    @surname = parameters.fetch(:surname) { raise "You didn't enter surname" }
    @name = parameters.fetch(:name) { raise "You didn't enter name" }
    @fathername = parameters.fetch(:fathername) { raise "You didn't enter fathername" }  

    self.tel = parameters[:tel]
    @id = parameters[:id]
    @tg = parameters[:tg]
    @email = parameters[:email]
    @git = parameters[:git]
  end

  def self.telephone_validation?(tel_phone)
    tel_phone.nil? || /^(\+?7|8)\d{10}$/.match?(tel_phone)
  end

  def self.telegram_validation?(telegram)
    telegram.nil? || /^@[a-zA-Z0-9_]{5, 32}$/.match?(telegram)
  end

  def self.email_validation?(email)
    email.nil? || /^[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+$/.match?(email)
  end

  def self.git_validation?(git)
    git.nil? || /^(https:\/\/)?(www\.)?github.com\/[a-zA-Z0-9_-]+$/.match?(git)
  end


  def tel=(tel_phone)
    if !self.class.telephone_validation?(tel_phone)
      raise "Your telephone number has invalid format!"
    end
    @tel = tel_phone
  end

  def tg=(telegram)
    if !self.class.telegram_validation?(telegram)
      raise "Your telegram has invalid format!"
    end
    @tg = telegram
  end

  def email=(email)
    if !self.class.email_validation?(email)
      raise "Your email has invalid format!"
    end
    @email = email
  end

  def git=(git)
    if !self.class.git_validation?(git)
      raise "Your git has invalid format!"
    end
    @git = git
  end


  def to_s()
    puts "-----------------"
    puts "#{@id}. #{@surname} #{@name} #{@fathername}" if @id 
    puts "- #{@tel}" if @tel
    puts "- #{@tg}" if @tg
    puts "- #{@email}" if @email
    puts "- #{@git}" if @git
    puts "-----------------"
  end

end
