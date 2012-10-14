require 'test_helper'
require 'gol/world'
require 'matrix'

class WorldTest < MiniTest::Unit::TestCase
  WORLD = [[1, 1, 0],
           [0, 1, 0],
           [1, 1, 0]]

  GOL = World.new(WORLD)

  def test_tick_integration
    next_world = World.new([[0, 1, 0, 0],
                            [0, 1, 0, 0],
                            [0, 1, 0, 0],
                            [1, 1, 0, 0]]).tick.instance_variable_get(:@data)

    assert_equal 4, next_world.size
    assert_equal [[0, 1, 1, 0],
                  [1, 1, 1, 0],
                  [0, 1, 1, 0],
                  [1, 1, 1, 0]], next_world
  end

  def test_format
    assert_equal "00 \n 0 \n00 ", GOL.format
  end

  def test_neighborhood
    assert_equal WORLD, GOL.neighborhood(1, 1).instance_variable_get(:@data)

    assert_equal [[0, 1, 1],
                  [0, 1, 1],
                  [0, 0, 1]], GOL.neighborhood(0, 0).instance_variable_get(:@data)

    assert_equal [[1, 0, 0],
                  [1, 0, 1],
                  [1, 0, 1]], GOL.neighborhood(2, 2).instance_variable_get(:@data)
  end

  describe "a non-square world" do
    NON_SQUARE = World.new([[0, 1, 1, 1],
                            [0, 1, 1, 1],
                            [0, 0, 1, 0]])

    it "should get the correct neighborhood" do
      assert_equal [[1, 1, 0],
                    [1, 0, 0],
                    [1, 1, 0]], NON_SQUARE.neighborhood(2, 3).instance_variable_get(:@data)
    end
  end

  def test_initialize
    random_gol = World.new
    world = random_gol.instance_variable_get(:@data)
    assert_equal 40, world.size
    world.each do |stripe|
      assert_equal 150, stripe.size
      stripe.each do |point|
        assert point == 0 || point == 1
      end
    end
  end
end