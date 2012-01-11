#  John Bae
#  jbae29@gmail.com

#  Postfix operation class.  
class Postfix
  def initialize
    @store = {}
  end

  #  Operate on the two integers
  def operation(a, b, oper)
    if operator?(oper)
      a.send(oper, b)
    else
      nil
    end
  end

  def operator?(oper)
    oper == "+" || oper == "-" || oper == "*" || oper == "/"
  end

  #  Get the numerical value.
  def value(val)
    #  If variable is found, use value.
    @store.key?(val) ? @store[val] : val.to_i
  end

  #  Evaluate the postfix expression.
  def evaluate(expression)
    stack = []
    expression.each do |part|
      if operator?(part)
        b = stack.pop
        a = stack.pop
        stack.push(operation(a, b, part))
      else
        val = value(part)
        stack.push(val)
      end    
    end

    stack.size == 1 ? stack[0] : nil
  end

  #  Process the expression.  Allows assignment of values to a variable, using let var = expression
  def process_expression(expression)
    begin
      parts = expression.split

      #  Assignment operation
      if parts[0] == "let"
        if parts[2] != "="
          puts "usage: let var_name = 'expression'"
          return
        end
        var = parts[1]
        sub_expression = parts[3, parts.count - 3]
        value = evaluate(sub_expression)
        if value.nil?
          puts "You cannot assign this expression to #{var}: #{expression}"
        else
          @store[var] = value
          puts "#{var} = #{value}"
        end
      else
        value = evaluate(parts)
        if value.nil?
          puts "Your expression could not be processed: #{expression}"        
        else
          puts value
        end
      end
    rescue
      puts "Your expression could not be processed: #{expression}"
    end  
  end
end
