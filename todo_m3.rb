class Todo 
	def initialize
		@title = "Todo"
		@items = ["Decide supervisor and driver roles", "Implement milestone1"]
	end
end

class HtmlTodo < Todo
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

class PlainTodo < Todo
	def display
		items_in_plain = @items.map { |e| " - #{e}" } .join("\n")
		puts "*** #{@title} ***
#{items_in_plain}"
	end
end

todo = HtmlTodo.new
todo.display
todo = PlainTodo.new
todo.display


# Pros:
# - easy to support new format
# - 
# Cons:
# - have to know which format is being used 
# - coulping between data and display