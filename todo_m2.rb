class Todo 
	def initialize
		@title = "Todo"
		@items = ["Decide supervisor and driver roles", "Implement milestone1"]
	end

	def display(format=:plain)
		puts case format
		when :html
			html_template 
		when :plain
			plain_template
		else
			plain_template
		end
	end

	def html_template
		items_in_html = @items.map { |e| "      <li>#{e}</li>" } .join("\n")
		"<html>
  <head>
    <title></title>
  </head>
  <body>
    <ul>
#{items_in_html}
    </ul>
  <body>
</html>"
	end

	def plain_template
		items_in_plain = @items.map { |e| " - #{e}" } .join("\n")
		"*** #{@title} ***
#{items_in_plain}"
	end

end

todo = Todo.new
todo.display :html
todo.display :plain
