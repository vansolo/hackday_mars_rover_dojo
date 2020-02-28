# frozen_string_literal:true

class Robot
  attr_accessor :coordinate_x, :coordinate_y, :cardinal_position

  def initialize(coordinate_x, coordinate_y, cardinal_position, universe)
    @coordinate_x = coordinate_x
    @coordinate_y = coordinate_y
    @cardinal_position = cardinal_position
    @universe = universe
  end

  def move(waypoint)
    waypoint_array = waypoint.split('')

    waypoint_array.each do |current_waypoint|
      case current_waypoint
      when 'M'
        move_forward
      when 'L' || 'R'
        rotate current_waypoint
      end
     StandardError if edge_collision
    end
  end

  def rotate(direction)
    if direction == 'L'
      case @cardinal_position
      when 'N'
        @cardinal_position = 'W'
      when 'W'
        @cardinal_position = 'S'
      when 'S'
        @cardinal_position = 'E'
      when 'E'
        @cardinal_position = 'N'
      end
    else
      case @cardinal_position
      when 'N'
        @cardinal_position = 'E'
      when 'W'
        @cardinal_position = 'N'
      when 'S'
        @cardinal_position = 'W'
      when 'E'
        @cardinal_position = 'S'
      end
    end
  end

  def move_forward
    case @cardinal_position
    when 'N'
      @coordinate_y += 1
    when 'W'
      @coordinate_x -= 1
    when 'S'
      @coordinate_y -= 1
    when 'E'
      @coordinate_x += 1
    end
  end

  def edge_collision
    @coordinate_x.negative? ||
      @coordinate_x > @universe.dimension_x ||
      @coordinate_y.negative? ||
      @coordinate_y > @universe.dimension_y
  end

  def print_coordinates
    "#{@coordinate_x} #{@coordinate_y} #{@cardinal_position}"
  end
end
