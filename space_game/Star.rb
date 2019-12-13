require "./Point"

class Star
    attr_accessor :position
    
    def initialize(point)
        @image = set_random_image
        @position = point
    end
    
    private
    def set_random_image
    end
end