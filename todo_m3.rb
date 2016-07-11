class Todo 
	def initialize
		@title = "Todo"
		@items = ["Decide supervisor and driver roles", "Implement milestone1"]
	end

	def display
		puts template
	end
end

class HtmlTodo < Todo
	def template
		"<html>
  <head>
    <title>#{title_template}</title>
  </head>
  <body>
    <ul>
#{items_template}
    </ul>
  <body>
</html>"
	end

	def items_template
		items_in_plain = @items.map { |e| item_template(e) } .join("")
	end

	def item_template(item)
		"      <li>#{item}</li>\n"
	end

	def title_template
		"#{@title}"
	end
end

class PlainTodo < Todo

	def template
		"#{title_template}
#{items_template}"
	end

	def items_template
		items_in_plain = @items.map { |e| item_template(e) } .join("")
	end

	def item_template(item)
		" - #{item}\n"
	end

	def title_template
		"*** #{@title} *** "
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