require 'test_helper'
require 'gol/world'

class WorldTest < MiniTest::Unit::TestCase
  WORLD = [[true, true, false],
           [false, true, false],
           [true, true, false]]

  GOL = World.new(WORLD)

  def test_tick_integration
    next_world = World.new([[false, true, false, false],
                            [false, true, false, false],
                            [false, true, false, false],
                            [true, true, false, false]]).tick

    assert_equal 4, next_world.size
    assert_equal [[false, true, true, false],
                  [true, true, true, false],
                  [false, true, true, false],
                  [true, true, true, false]], next_world
  end

  def test_format
    assert_equal "00 \n 0 \n00 ", GOL.format
  end

  def test_neighborhood
    assert_equal WORLD, GOL.neighborhood(1, 1).instance_variable_get(:@data)

    assert_equal [[false, true, true],
                  [false, true, true],
                  [false, false, true]], GOL.neighborhood(0, 0).instance_variable_get(:@data)

    assert_equal [[true, false, false],
                  [true, false, true],
                  [true, false, true]], GOL.neighborhood(2, 2).instance_variable_get(:@data)
  end

  describe "a non-square world" do
    NON_SQUARE = World.new([[false, true, true, true],
                            [false, true, true, true],
                            [false, false, true, false]])

    it "should get the correct neighborhood" do
      assert_equal [[true, true, false],
                    [true, false, false],
                    [true, true, false]], NON_SQUARE.neighborhood(2, 3).instance_variable_get(:@data)
    end
  end

  def test_initialize
    random_gol = World.new
    world = random_gol.instance_variable_get(:@data)
    assert_equal 40, world.size
    world.each do |stripe|
      assert_equal 150, stripe.size
      stripe.each do |point|
        assert point == true || point == false
      end
    end
  end
end