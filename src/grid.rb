# frozen_string_literal: true

class Grid
  attr_accessor :dimension_x, :dimension_y, :size

  def initialize(dimension_x, dimension_y)
    @dimension_x = dimension_x
    @dimension_y = dimension_y

    @size = "#{@dimension_x} #{@dimension_y}"
  end
end
