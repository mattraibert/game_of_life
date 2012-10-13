class Neighborhood
  def initialize(neighborhood)
    @data = neighborhood
  end

  def point(row, col)
    @data[row, col]
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
    @data.inject(&:+)
  end

  def center
    point(1, 1)
  end
end
