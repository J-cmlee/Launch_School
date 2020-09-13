# frozen_string_literal: true

def transpose(input)
  new_matrix = [[0, 0, 0],
                [0, 0, 0],
                [0, 0, 0]]
  0.upto(2) do |i|
    0.upto(2) do |j|
      new_matrix[j][i] = input[i][j]
    end
  end
  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
