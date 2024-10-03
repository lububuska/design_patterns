require './class_student.rb'

class StudentShort
  attr_reader :fio, :git, :id, :contact

  def initialize(fio: nil, git: nil, id:nil, contact: nil)
    @fio = fio
    @git = git
    @id = id
    @contact = contact
  end

  def self.from_student(student)
    new(id: student.id, fio: student.get_fio(), git: student.get_git(), contact:student.get_contacts())
  end

  def self.from_string(id:, string:)
    new(id: id, fio: parse_fio(string) , git: parse_git(string), contact:parse_contact(string))
  end

  def to_s
    puts "-----------------"
    puts "#{@id}. #{@fio}" 
    puts "- #{@contact}" 
    puts "- #{@git}" 
    puts "-----------------"
  end

  private

  def self.parse_fio(string)
    match = string.match(/ФИО: ([А-ЯЁ][а-яё]+ [А-ЯЁ]\. [А-ЯЁ]\.)/)
    match ? match[1] : nil
  end

  def self.parse_git(string)
    match = string.match(/git: (github\.com\/([a-zA-Z0-9\-]+))/)
    match ? match[1] : nil
  end

  def self.parse_contact(string)
    match = string.match(/(telegram|telephone number|email):\s?([^,]+)/)
    match ? match[2] : nil
  end
end