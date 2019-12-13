require "./Point"
require "gosu"

class Star
    attr_accessor :position

    def initialize(point)
        @image = Gosu::Image.new(set_random_image)
        @position = point
    end
    
    private
    def set_random_image
        random_number = rand()
        path = "assets/star1.jpg"
        if random_number => 0.5
            path = "assets/star2.png"
        end
        return path
    end
end