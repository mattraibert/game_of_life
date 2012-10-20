require 'test_helper'
require 'gol/array'
require 'gol/toys'

class ArrayTest < MiniTest::Unit::TestCase
  def test_something
    result = 4.times.map { 4.times.map { false } }.add_array([[true, false, true], [false, true, true]])
    assert_equal([[true, false, true, false],
                  [false, true, true, false],
                  [false, false, false, false],
                  [false, false, false, false]], result)
  end

  def test_empty
    assert_equal 4.times.map { 4.times.map { false } }, Toys.empty(4, 4)
    assert_equal Toys.floater, Toys.empty(3, 3).add_array(Toys.floater)
    assert_equal Toys.glider_gun, Toys.empty(38, 11).add_array(Toys.glider_gun)
  end
end