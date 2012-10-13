require 'gol/neighborhood'

class Gol
  def initialize(world = Gol.init(39))
    @world = world
  end

  def tick
    next_world = @world.each_with_index.map do |stripe, x|
      stripe.each_index.map do |y|
        neighborhood(x, y).tick
      end
    end
    Gol.new(next_world)
  end

  def format
    @world.map { |stripe| stripe.map { |x| x == 1 ? ?0 : ' ' }.join }.join "\n"
  end

  def point(x, y)
    @world[x][y]
  end

  def size
    @world.size
  end

  def neighborhood(x, y)
    Neighborhood.at_point(self, x, y)
  end

  def self.init(size)
    size.times.map { size.times.map { rand 2 }.freeze }.freeze
  end
end