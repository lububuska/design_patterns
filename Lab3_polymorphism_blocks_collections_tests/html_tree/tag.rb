class Tag
  attr_accessor :name, :attributes, :children, :content, :self_closing
  def initialize(name:, attributes: {}, children: [], content: "", self_closing: false)
    self.name = name
    self.attributes = attributes
    self.children = children
    self.content = content
    self.self_closing = self_closing
  end

  def add_child(tag)
    raise "Одиночные теги не могут иметь тегов-детей" if self_closing
    self.children.append(tag)
  end

  #строка
  def to_s()
    if self_closing
      return "<#{name} #{attributes.map{|key,value| "#{key}=\"#{value}\""}.join(' ')}>"
    else
      return "<#{name} #{attributes.map{|key,value| "#{key}=\"#{value}\""}.join(' ')}>#{content}#{children.join}</#{name}>"
    end
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