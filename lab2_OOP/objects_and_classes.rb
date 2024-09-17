class Student
  attr_accessor :surname, :name, :fathername, :id, :tel, :tg, :email, :git
  
  def initialize(surname, name, fathername, id = nil, tel = nil, tg = nil, email = nil, git = nil)
    @surname = surname
    @name = name
    @fathername = fathername
    @id = id
    @tel = tel
    @tg = tg
    @email = email
    @git = git
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
