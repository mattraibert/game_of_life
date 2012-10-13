require 'gol/neighborhood'

class Gol
  def initialize(world = Gol.init(39))
    @world = world
  end

  def tick
    next_world = @world.each_with_index.map do |stripe, row|
      stripe.each_index.map do |col|
        neighborhood(row, col).tick
      end
    end
    Gol.new(next_world)
  end

  def format
    @world.map { |row| row.map { |col| col == 1 ? ?0 : ' ' }.join }.join "\n"
  end

  def point(row, col)
    @world[row][col]
  end

  def size
    @world.size
  end

  def neighborhood(row, col)
    Neighborhood.at_point(self, row, col)
  end

  def self.init(size)
    size.times.map { size.times.map { rand 2 }.freeze }.freeze
  end
end