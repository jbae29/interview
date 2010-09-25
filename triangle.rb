@triangle = []

def load_file(file_name)
  input_file = File.new(file_name, "r")

  while (input_line = input_file.gets)
    row = []
    input_line.split(" ").each do |input|
      row << input.to_i
    end
    @triangle.unshift row
  end
  input_file.close  
end

load_file("triangle_input.txt")

for row_index in 1..@triangle.length-1
  for col_index in 0..@triangle[row_index].length-1
    left_child  = @triangle[row_index-1][col_index]
    right_child = @triangle[row_index-1][col_index+1]
    @triangle[row_index][col_index] += left_child > right_child ? left_child : right_child
  end
end

puts @triangle[@triangle.length-1][0]