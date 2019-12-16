require "./Point"
require "./utils"

class Bullet
    attr_accessor :position
    attr_reader :width, :height

    def initialize(initial_position_x, initial_position_y, rotation_angle)
        @rotation_angle = rotation_angle
        @image = Gosu::Image.new("assets/bullet.png")
        @scale_image_x = 0.1
        @scale_image_y = 0.03
        @width = @image.width*@scale_image_x
        @height = @image.height*@scale_image_y
        @position = Point.new(initial_position_x, initial_position_y - @height / 2)
        @step_advance = 7.5
    end

    def draw
        @image.draw_rot(@position.x, @position.y, 0, @rotation_angle, 0.5, 0.5 , @scale_image_x, @scale_image_y)
    end

    def update
        if @rotation_angle == 0
            @position.y = @position.y - @step_advance
        else
            @position.x = @position.x + @step_advance*Math.sin(degree_to_rad(@rotation_angle))
            @position.y = @position.y - @step_advance*Math.cos(degree_to_rad(@rotation_angle))
        end
    end
end