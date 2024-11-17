require "./tag.rb"
class Tree
  attr_accessor :root
  def initialize(html_string)
    self.root = parse_from_html(html_string)
  end

  private

  def parse_from_html(html_string)
    stack = []
    current = nil
    root = nil
    str = html_string.scan(/<[^>]+>|[^<]+/)
    until str.empty?
      substr = str.shift
      if substr.start_with?("<")
        if substr.start_with?("</")
          stack.pop()
          current = stack.last
        else
          tag_content = substr[1..-2].strip
          name = tag_content.match(/^\w+/)[0]
          attributes = tag_content.scan(/(\w+)="([^"]+)/).to_h
          new_tag = Tag.new(name: name, attributes: attributes)
          if current
            current.add_child(new_tag)
          else
            root = new_tag
          end
          unless substr.end_with?("/>")
            current = new_tag
            stack.push(current) 
          end
        end
      else
        current.content += substr if current
      end
    end
    return root      
  end
end


html = "<body><h1 class=\"title\">Hello, World!</h1><p id=\"main\">This is a test.</p></body>"
tree = Tree.new(html)

puts tree.root.to_s