class Person
  attr_reader :id, :git 
  def initialize(id: nil, git: nil)
    @id = id
    @git = git
  end

  def self.is_surname?(surname)
    /^[А-ЯЁ][а-яё]+(-[А-ЯЁ][а-яё]+)?$/.match?(surname)
  end

  def self.is_name?(name)
    /^[А-ЯЁ][а-яё]+$/.match?(name)
  end

  def self.is_fathername?(fathername)
    /^[А-ЯЁ][а-яё]+$/.match?(fathername)
  end

  def self.is_telephone?(tel_phone)
    tel_phone.nil? || /^(\+?7|8)\d{10}$/.match?(tel_phone)
  end

  def self.is_telegram?(telegram)
    telegram.nil? || /^@[a-zA-Z0-9_]{5,32}$/.match?(telegram)
  end

  def self.is_email?(email)
    email.nil? || /^[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+$/.match?(email)
  end

  def self.is_git?(git)
    git.nil? || /^(https:\/\/)?(www\.)?github.com\/[a-zA-Z0-9_-]+$/.match?(git)
  end

  def has_git?()
    Person.git_valid?(@git)
  end

  def has_contacts?()
    !self.contact.nil?
  end

  def validate?()
    has_git?() && has_contacts?()
  end

  def contact()
    raise "Contacts are not provided!"
  end
end
