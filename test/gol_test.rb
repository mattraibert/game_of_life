require 'test_helper'
require 'gol'

class GolTest < MiniTest::Unit::TestCase
  WORLD = [[1, 1, 0],
           [0, 1, 0],
           [1, 1, 0]]

  GOL = Gol.new(WORLD)

  def test_format
    assert_equal "00 \n 0 \n00 ", GOL.format
  end

  def test_neighborhood
    assert_equal WORLD, GOL.neighborhood(1, 1)
    assert_equal [[0, 1, 1], [0, 1, 1], [0, 0, 1]], GOL.neighborhood(0, 0)
  end
end