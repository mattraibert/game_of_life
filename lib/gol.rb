require 'gol/neighborhood'
require 'matrix'

class Gol
  def initialize(world = Gol.init(80, 40))
    @data = world
  end

  def height
    @data.row_size
  end

  def width
    @data.column_size
  end

  def tick
    next_world = Matrix.build(@data.row_size, @data.column_size) { |row, col| neighborhood(row, col).tick }
    Gol.new(next_world)
  end

  def format
    @data.map { |x| x == 1 ? ?0 : ' ' }.row_vectors.map { |vector| vector.to_a.join }.join "\n"
  end

  def point(row, col)
    @data[row, col]
  end

  def neighborhood(row, col)
    Neighborhood.new(@data.neighbors_matrix(row, col))
  end

  def self.init(width, height)
    Matrix.build(height, width) { rand 2 }.freeze
  end
end

class Matrix
  def neighbors_matrix(row, col, nrings = 1)
    Matrix.build(nrings * 2 + 1) do |nrow, ncol|
      row_index = (row + nrow - nrings) % row_size
      col_index = (col + ncol - nrings) % column_size
      self[row_index, col_index]
    end
  end
end