require "postfix.rb"

#  interactive loop.
#  usage: ruby postfix.rb
def repl
  postfix = Postfix.new

  puts "Type q to quit."
  while true
    print "> "
    expression = gets.chomp
    if expression == "q" || expression == "quit"
      break
    end
    postfix.process_expression(expression)
  end
end

repl