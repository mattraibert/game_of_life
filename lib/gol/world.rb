require 'gol/neighborhood'

class World
  attr_reader :data

  def initialize(world = World.init(40, 150))
    @data = world
  end

  def height
    @data.size
  end

  def width
    @data.first.size
  end

  def tick
    @data = @data.each_with_index.map do |stripe, row|
      stripe.each_index.map do |col|
        neighborhood(row, col).tick
      end
    end
  end

  def format
    @data.map { |row| row.map { |col| col ? ?0 : ' ' }.join }.join "\n"
  end

  def point(row, col)
    @data[row][col]
  end

  def neighborhood(row, col)
    Neighborhood.at_point(self, row, col)
  end

  def self.init(rows, cols, density = 0.5)
    rows.times.map { cols.times.map { rand < density } }
  end
end
