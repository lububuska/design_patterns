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
    tel_phone.nil? || /\A(\+?7|8)\d{10}\z/.match?(tel_phone)
  end

  def tel=(tel_phone)
    if !self.class.telephone_validation?(tel_phone)
      raise "Your telephone number has invalid format!"
    end
    @tel = tel_phone
  end

  def show_information()
    puts "-----------------"
    puts "#{@id}. #{@surname} #{@name} #{@fathername}" if @id 
    puts "- #{@tel}" if @tel
    puts "- #{@tg}" if @tg
    puts "- #{@email}" if @email
    puts "- #{@git}" if @git
    puts "-----------------"
  end

end
