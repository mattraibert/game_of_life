require 'test_helper'
require 'gol/neighborhood'

class NeighborhoodTest < MiniTest::Unit::TestCase
  NEIGHBORHOOD = Neighborhood.new([[true, true, false],
                                   [false, true, false],
                                   [true, true, false]])

  def test_sum
    assert_equal 5, NEIGHBORHOOD.sum
  end

  def test_center
    assert_equal true, NEIGHBORHOOD.center
  end

  describe NEIGHBORHOOD do
    it "should die with fewer than two live neighbors" do
      assert_equal false, Neighborhood.new([[true, false, false],
                                            [false, true, false],
                                            [false, false, false]]).tick
    end

    it "should survive with two or three live neighbors" do
      assert_equal true, Neighborhood.new([[true, true, false],
                                           [false, true, false],
                                           [false, false, false]]).tick

      assert_equal true, Neighborhood.new([[true, false, false],
                                           [true, true, false],
                                           [true, false, false]]).tick
    end

    it "should die with more than three live neighbors" do
      assert_equal false, Neighborhood.new([[true, false, true],
                                            [true, true, false],
                                            [true, false, false]]).tick

      assert_equal false, Neighborhood.new([[true, true, true],
                                            [true, true, true],
                                            [true, true, true]]).tick
    end

    it "should be born with exactly three live neighbors" do
      assert_equal true, Neighborhood.new([[false, true, false],
                                           [true, false, true],
                                           [false, false, false]]).tick

      assert_equal true, Neighborhood.new([[true, false, false],
                                           [true, false, false],
                                           [true, false, false]]).tick
    end
  end
end
