require "gosu"
require "./Point"

class Ship 
    attr_accessor :position, :rotation_angle, :velocity
    attr_reader :width, :height

    def initialize(initial_x, initial_y)
        @position = Point.new(initial_x, initial_y)
        @image = Gosu::Image.new("assets/ship.png")
        @rotation_angle = 0
        @scale_image_x = 0.25
        @scale_image_y = 0.25
        @width = @image.width*@scale_image_x
        @height = @image.height*@scale_image_y
        @velocity = 3
        @acceleration = 3
    end

    def draw
        @image.draw_rot(@position.x, @position.y, 0, @rotation_angle, 0.5, 0.5 , @scale_image_x, @scale_image_y)
    end

    def move_right
        @position.x = @position.x + @velocity
    end

    def move_left
        @position.x = @position.x - @velocity
    end

    def move_up
        @position.y = @position.y - @velocity
    end

    def move_down
        @position.y = @position.y + @velocity
    end

    def rotate_right
        @rotation_angle = @rotation_angle + @velocity
    end

    def rotate_left
        @rotation_angle = @rotation_angle - @velocity
    end

    def accelerate
        @velocity = @velocity + @acceleration
    end

    def slow_down
        @velocity = @velocity - @acceleration
    end
end