class Neighborhood
  def self.at_point(world, x, y)
    Neighborhood.new((-1..1).map { |dx| (-1..1).map { |dy| world.point(x + dx, y + dy) } })
  end

  def initialize(neighborhood)
    @neighborhood = neighborhood
  end

  def point(x, y)
    @neighborhood[x][y]
  end

  def tick
    Neighborhood.calculate_point(center, sum - center)
  end

  def self.calculate_point(point, neighbors)
    if neighbors == 3 or (neighbors == 2 and point == 1)
      1
    else
      0
    end
  end

  def sum
    @neighborhood.inject(&:+).inject(&:+)
  end

  def center
    point(1, 1)
  end
end
