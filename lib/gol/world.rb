require 'gol/matrix'

class World
  def initialize(world = World.init(150, 40))
    @data = world
  end

  def height
    @data.row_size
  end

  def width
    @data.column_size
  end

  def tick
    World.new(Matrix.build(@data.row_size, @data.column_size) { |row, col| neighborhood(row, col).tick })
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
