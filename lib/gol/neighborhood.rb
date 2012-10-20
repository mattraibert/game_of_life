class TrueClass
  def count(other)
    other ? 2 : 1
  end
end

class FalseClass
  def count(other)
    other ? 1 : 0
  end
end

class Fixnum
  def count(other)
    other ? self + 1 : self
  end
end

class Neighborhood
  def self.at_point(world, row, col)
    Neighborhood.new((-1..1).map do |delta_row|
      (-1..1).map do |delta_col|
        r = (row + delta_row) % world.height
        c = (col + delta_col) % world.width
        world.point(r, c)
      end
    end)
  end

  def initialize(neighborhood)
    @data = neighborhood
  end

  def point(row, col)
    @data[row][col]
  end

  def tick
    Neighborhood.calculate_point(center, sum)
  end

  def self.calculate_point(point, sum)
    sum == 3 or (sum == 4 and point)
  end

  def sum
    @data.inject(&:+).inject(&:count)
  end

  def center
    point(1, 1)
  end
end
