# frozen_string_literal: true

require '../src/grid.rb'
require 'minitest/autorun'

class TestGrid < Minitest::Test
  def setup
    @grid = Grid.new(4, 4)
  end

  def test_initialize_grid
    assert_equal 4, @grid.dimension_x
    assert_equal 4, @grid.dimension_y
  end

  def test_grid_size
    assert_equal '4 4', @grid.size
  end
end
