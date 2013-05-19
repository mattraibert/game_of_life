require 'five_leaves/range_util.rb'
require 'peach'

class Field
  attr_reader :data

  def initialize(field = Field.init(40, 150))
    @data = field
  end

  def rows
    @rows ||= @data.size
  end

  def columns
    @columns ||= @data.first.size
  end

  def self.init(rows, cols, density = 0.5)
    rows.times.map { cols.times.map { rand < density } }
  end

  def tick
    @data = @data.each_with_index.pmap do |stripe, row|
      stripe.each_with_index.map do |it, col|
        descendant?(row, col)
      end
    end
  end

  def alive?(row, col)
    return false if row < 0 || row >= rows
    return false if col < 0 || col >= columns
    @data[row][col]
  end

  def relatives(row, col)
    relatives = 0
    (-1..1).each do |row_off|
      (-1..1).each do |col_off|
        relatives += 1 if alive?(row + row_off, col + col_off)
      end
    end
    relatives
  end

  def descendant?(row, col)
    relatives = relatives(row, col)
    if @data[row][col]
      relatives == 3 || relatives == 4
    else
      relatives == 3
    end
  end

  def format
    @data.map { |row| row.map { |col| col ? ?0 : ' ' }.join }.join "\n"
  end

  def point(row, col)
    @data[row][col]
  end
end

