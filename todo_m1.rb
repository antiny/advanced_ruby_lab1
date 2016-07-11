class Todo 
	def initialize
		@title = "Todo"
		@items = ["Decide supervisor and driver roles", "Implement milestone1"]
	end

	def display
		items_in_html = @items.map { |e| "      <li>#{e}</li>" } .join("\n")
		puts "<html>
  <head>
    <title>#{@title}</title>
  </head>
  <body>
    <ul>
#{items_in_html}
    </ul>
  <body>
</html>"
	end
end

todo = Todo.new
todo.display