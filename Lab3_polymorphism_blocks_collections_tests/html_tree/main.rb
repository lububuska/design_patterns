require './tag.rb'
require './tree.rb'

tree = Tree.new(
  '<html lang="ru">
    <head>
      <title>Пример</title>
    </head>
    <body>
      <h1 id="main-heading" class="header-text">Привет!</h1>
      <p "font-family: Arial, sans-serif; background-color: #f4f4f4;">Это пример простого HTML-документа.</p>
    </body>
  </html>'
)

puts 'dfs'
tree.dfs_iterator.each do |element|
  puts "#{element}"
end

puts "\n--------------\nbfs"
tree.bfs_iterator.each do |element|
  puts "#{element}"
end