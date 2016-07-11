class Todo 
	attr_accessor :formatter

	def initialize(formatter)
		@formatter = formatter
		@title = "Todo"
		@items = ["Decide supervisor and driver roles", "Implement milestone1"]
	end

	def display
		puts @formatter.display(@title, @items)
	end
end

class Formatter
	def display(title, items)
		raise "not implemented yet"
	end
end

class HtmlFormatter < Formatter
	def display(title, items)
		@title, @items = title, items
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
		items_in_plain = @items.map { |e| item_template(e) } .join("\n")
	end

	def item_template(item)
		"      <li>#{item}</li>"
	end

	def title_template
		"#{@title}"
	end
end

class PlainFormatter
	def display(title, items)
		@title, @items = title, items
		"#{title_template}
#{items_template}"
	end

	def items_template
		items_in_plain = @items.map { |e| item_template(e) } .join("\n")
	end

	def item_template(item)
		" - #{item}"
	end

	def title_template
		"*** #{@title} *** "
	end
end



todo = Todo.new(HtmlFormatter.new)
todo.display
todo1 = Todo.new(PlainFormatter.new)
todo1.display

todo1.formatter = HtmlFormatter.new
todo1.display


# Pros:
# - can change formatter any time
# -
# Cons:
# - have to pass param to another class, what if there are too many parameters 
# -

