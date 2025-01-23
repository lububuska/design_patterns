class Node include Enumerable
  attr_accessor :student, :left, :right, :parent
  attr_reader :value

  def initialize(value, parent = nil)
    @value = value     
    @left = nil        
    @right = nil       
    @parent = nil   
  end

  def to_s()
    return @value.to_s
  end

  def insert(new_node)
    if new_node.value < @value
      if @left
        @left.insert(new_node)
      else 
        @left = new_node
      end
    else
      if @right
        @right.insert(new_node)
      else 
        @right = new_node
      end
    end
  end

  def each(&block)
    @left.each(&block) if @left
    block.call(self)
    @right.each(&block) if @right
  end
end

class Binary_tree
  attr_accessor :root

  def initialize
    @root = nil                
  end

  def add_node(value)
    new_node = Node.new(value)
    if @root.nil?
      @root = new_node
    else
      root.insert(new_node)
    end
  end

  def each(&block)
    return @root.each(&block)
  end

end