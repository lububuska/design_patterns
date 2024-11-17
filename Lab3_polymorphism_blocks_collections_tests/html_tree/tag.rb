class Tag
  attr_accessor :name, :attributes, :children, :content
  def initialize(name:, attributes: {}, children: [], content: "")
    self.name = name
    self.attributes = attributes
    self.children = children
    self.content = content
  end

  def add_child(tag)
    self.children.append(tag)
  end

  #строка
  def to_s
    attrs = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
    "<#{name}#{' ' if !attrs.empty?}#{attrs}>#{content}#{children.join}</#{name}>"
  end
  

  #булеан
  def has_attribute?(attribute)
    return self.attributes.key?(attribute)
  end

  #число
  def amount_of_children()
    return self.children.size
  end
end