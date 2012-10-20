require 'five_leaves/range_util.rb'
require 'benchmark'

class Field
  def initialize(field = Field.init(40, 150))
    @field = field
  end

  def rows
    @rows ||= @field.size
  end

  def columns
    @columns ||= @field.first.size
  end

  def self.init(rows, cols, density = 0.5)
    rows.times.map { cols.times.map { rand < density } }
  end

  def tick
    @field = @field.each_with_index.map do |stripe, row|
      stripe.each_with_index.map do |it, col|
        descendant?(row, col)
      end
    end
  end

  def alive?(row, col)
    return false if row < 0 || row >= rows
    return false if col < 0 || col >= columns
    @field[row][col]
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
    if @field[row][col]
      relatives == 3 || relatives == 4
    else
      relatives == 3
    end
  end

  def format
    @field.map { |row| row.map { |col| col ? ?0 : ' ' }.join }.join "\n"
  end
end

Benchmark.bm do |x|
  x.report do
    @field = Field.new
    100.times do
      system('clear')
      puts @field.format
      @field.tick
    end
  end
end
