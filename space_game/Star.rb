require "./Point"
require "gosu"

class Star
    attr_accessor :position
    attr_reader :image

    def initialize(point)
        @image = Gosu::Image.new(set_random_image)
        @position = point
    end
    
    def draw
        @image.draw(@position.x,@position.y,0,1, 1, 0x66ffffff)
    end

    private
    def set_random_image
        random_number = rand()
        path = "assets/star1.png"
        if random_number >= 0.5
            path = "assets/star2.png"
        end
        return path
    end
end