require 'test_helper'
require 'gol/neighborhood'
require 'matrix'

class NeighborhoodTest < MiniTest::Unit::TestCase
  NEIGHBORHOOD = Neighborhood.new(Matrix[[1, 1, 0],
                                         [0, 1, 0],
                                         [1, 1, 0]])

  def test_sum
    assert_equal 5, NEIGHBORHOOD.sum
  end

  def test_center
    assert_equal 1, NEIGHBORHOOD.center
  end

  describe NEIGHBORHOOD do
    it "should die with fewer than two live neighbors" do
      assert_equal 0, Neighborhood.new(Matrix[[1, 0, 0],
                                              [0, 1, 0],
                                              [0, 0, 0]]).tick
    end

    it "should survive with two or three live neighbors" do
      assert_equal 1, Neighborhood.new(Matrix[[1, 1, 0],
                                              [0, 1, 0],
                                              [0, 0, 0]]).tick

      assert_equal 1, Neighborhood.new(Matrix[[1, 0, 0],
                                              [1, 1, 0],
                                              [1, 0, 0]]).tick
    end

    it "should die with more than three live neighbors" do
      assert_equal 0, Neighborhood.new(Matrix[[1, 0, 1],
                                              [1, 1, 0],
                                              [1, 0, 0]]).tick

      assert_equal 0, Neighborhood.new(Matrix[[1, 1, 1],
                                              [1, 1, 1],
                                              [1, 1, 1]]).tick
    end

    it "should be born with exactly three live neighbors" do
      assert_equal 1, Neighborhood.new(Matrix[[0, 1, 0],
                                              [1, 0, 1],
                                              [0, 0, 0]]).tick

      assert_equal 1, Neighborhood.new(Matrix[[1, 0, 0],
                                              [1, 0, 0],
                                              [1, 0, 0]]).tick
    end
  end
end
