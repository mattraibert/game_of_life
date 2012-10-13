require 'gol/neighborhood'

class Gol
  def initialize(world = Gol.init(10))
    @world = world
  end

  def tick
    @world = @world.each_with_index.map do |stripe, x|
      stripe.each_index.map do |y|
        neighborhood(x, y).tick
      end
    end
  end

  def format
    @world.map { |stripe| stripe.map { |x| x == 1 ? ?0 : ' ' }.join }.join "\n"
  end

  def point(x, y)
    @world[x][y]
  end

  def neighborhood(x, y)
    Neighborhood.new(self, x, y)
  end

  def self.init(size)
    size.times.map { size.times.map { rand 2 }.freeze }.freeze
  end
end