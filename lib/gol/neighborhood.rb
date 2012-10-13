class Neighborhood
  def initialize(world, x, y)
    @neighborhood = (-1..1).map { |dx| (-1..1).map { |dy| world.point(x + dx, y + dy) } }
  end

  def point(x, y)
    @neighborhood[x][y]
  end

  def tick
    sum - center
  end

  def sum
    @neighborhood.inject(&:+).inject(&:+)
  end

  def center
    point(1, 1)
  end
end
