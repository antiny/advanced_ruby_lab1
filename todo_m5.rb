class Todo 
	attr_accessor :formatter, :title, :items

	def initialize(formatter = nil, &block)
		@title = "Todo"
		@items = ["Decide supervisor and driver roles", "Implement milestone1"]

		if block_given?
			@formatter = block
	 	else
			@formatter = formatter
		end
	end

	def display
	 	if formatter.respond_to?(:call)
			puts formatter.call(self)
		else 
			puts formatter.display(title, items)
		end
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

todo2 = Todo.new do |context|
	s = "# #{context.title}\n"
	context.items.each do |item| 
		s << "- [] #{item}\n"
	end
	puts s
end
todo2.display

# Pros:
# - can change formatter any time
# -
# Cons:
# - have to pass param to another class, what if there are too many parameters 
# -

