class Iterator
  include Enumerable
  attr_reader :root

  def initialize(root)
    self.root = root
  end

  def each 
    enumerator.each do |element| 
      yield element
    end
  end

  private

  attr_writer :root

  def enumerator
  end
end