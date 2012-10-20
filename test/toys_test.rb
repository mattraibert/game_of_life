require 'test_helper'
require 'gol/toys'

class ToysTest < MiniTest::Unit::TestCase
  def test_add_arrays
    result = Toys.add_arrays Toys.empty(4, 4), ([[true, false, true],
                                                 [false, true, true]])
    assert_equal([[true, false, true, false],
                  [false, true, true, false],
                  [false, false, false, false],
                  [false, false, false, false]], result)
  end

  def test_empty
    assert_equal 3.times.map { 4.times.map { false } }, Toys.empty(4, 3)
    assert_equal 4.times.map { 4.times.map { false } }, Toys.empty(4)
    assert_equal Toys.floater, Toys.add_arrays(Toys.empty(3, 3), (Toys.floater))
    assert_equal Toys.glider_gun, Toys.add_arrays(Toys.empty(38, 11), (Toys.glider_gun))
  end
end