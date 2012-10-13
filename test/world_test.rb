require 'test_helper'
require 'gol/world'
require 'matrix'

class WorldTest < MiniTest::Unit::TestCase
  WORLD = Matrix[[1, 1, 0],
                 [0, 1, 0],
                 [1, 1, 0]]

  GOL = World.new(WORLD)

  def test_tick_integration
    next_world = World.new(Matrix[[0, 1, 0, 0],
                                [0, 1, 0, 0],
                                [0, 1, 0, 0],
                                [1, 1, 0, 0]]).tick

    assert_equal 4, next_world.width
    assert_equal 4, next_world.height
    assert_equal Matrix[[0, 1, 1, 0],
                        [1, 1, 1, 0],
                        [0, 1, 1, 0],
                        [1, 1, 1, 0]], next_world.instance_variable_get(:@data)
  end

  def test_format
    assert_equal "00 \n 0 \n00 ", GOL.format
  end

  def test_neighborhood
    assert_equal WORLD, GOL.neighborhood(1, 1).instance_variable_get(:@data)

    assert_equal Matrix[[0, 1, 1],
                        [0, 1, 1],
                        [0, 0, 1]], GOL.neighborhood(0, 0).instance_variable_get(:@data)

    assert_equal Matrix[[1, 0, 0],
                        [1, 0, 1],
                        [1, 0, 1]], GOL.neighborhood(2, 2).instance_variable_get(:@data)
  end

  describe "a non-square world" do
    NON_SQUARE = World.new(Matrix[[0, 1, 1, 1],
                                [0, 1, 1, 1],
                                [0, 0, 1, 0]])

    it "should get the correct neighborhood" do
      assert_equal Matrix[[1, 1, 0],
                          [1, 0, 0],
                          [1, 1, 0]], NON_SQUARE.neighborhood(2, 3).instance_variable_get(:@data)
    end
  end

  def test_initialize
    random_gol = World.new
    world = random_gol.instance_variable_get(:@data)
    assert_equal 40, world.row_size
    assert_equal 150, world.column_size
    world.each do |point|
      assert point == 0 || point == 1
    end
  end
end