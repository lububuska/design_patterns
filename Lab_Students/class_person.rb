class Person
  attr_reader :id, :git 
  def initialize(id: nil, git: nil)
    @id = id
    @git = git
  end

  def self.is_git_valid?(git)
    git.nil? || /^(https:\/\/)?(www\.)?github.com\/[a-zA-Z0-9_-]+$/.match?(git)
  end

  def has_git?()
    if @git.nil? && self.class.is_git_valid?(git)
      raise "Your git is empty!"
    end
  end

  def contact()
    raise "Contacts are not provided!"
  end
end
