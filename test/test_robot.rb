# frozen_string_literal: true

require '../src/robot.rb'
require '../src/grid.rb'
require 'minitest/autorun'

class TestRobot < Minitest::Test
  def setup
    @grid = Grid.new(5, 5)
    @robot = Robot.new(1, 2, 'N', @grid)
  end

  def test_rotate
    @robot.rotate('L')
    assert_equal '1 2 W', @robot.print_coordinates
    @robot.rotate('R')
    assert_equal '1 2 N', @robot.print_coordinates
  end

  def test_move_forward
    @robot.move_forward
    assert_equal '1 3 N', @robot.print_coordinates
  end

  def test_move
    @robot.move('LML')
    assert_equal '0 2 S', @robot.print_coordinates
  end

  def test_edge_collision
    proc { @robot.move('LLMMM') }.must_raise StandardError
  end
end
