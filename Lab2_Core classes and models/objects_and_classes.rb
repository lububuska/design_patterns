class Student
  attr_accessor :surname, :name, :fathername, :id, :tel, :tg, :email, :git
  
  def initialize(parameters)
    
    if (!parameters[:surname]) then
      raise "You didn't enter surname"
    else
      @surname = parameters[:surname]
    end

    if (!parameters[:name]) then
      raise "You didn't enter name"
    else
      @name = parameters[:name]
    end

    if (!parameters[:fathername]) then
      raise "You didn't enter fathername"
    else
      @fathername = parameters[:fathername]
    end

    @id = parameters[:id]
    @tel = parameters[:tel]
    @tg = parameters[:tg]
    @email = parameters[:email]
    @git = parameters[:git]
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
