class World
  attr_reader :data

  def initialize(world = World.init(150, 40))
    @data = world
  end

  def height
    @data.size
  end

  def width
    @data.first.size
  end

  def tick
    next_world = @data.each_with_index.map do |stripe, row|
      stripe.each_index.map do |col|
        neighborhood(row, col).tick
      end
    end
    World.new(next_world)
  end

  def format
    @data.map { |row| row.map { |col| col == 1 ? ?0 : ' ' }.join }.join "\n"
  end

  def point(row, col)
    @data[row][col]
  end

  def neighborhood(row, col)
    Neighborhood.at_point(self, row, col)
  end

  def self.init(width, height)
    height.times.map { width.times.map { rand 2 }.freeze }.freeze
  end
end
