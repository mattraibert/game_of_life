class Neighborhood
  def self.at_point(world, row, col)
    Neighborhood.new((-1..1).map { |delta_row| (-1..1).map { |delta_col| world.point((row + delta_row) % world.height, (col + delta_col) % world.width) } })
  end

  def initialize(neighborhood)
    @neighborhood = neighborhood
  end

  def point(row, col)
    @neighborhood[row][col]
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
