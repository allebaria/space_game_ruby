require "./Point"
require "./Star"

class Background
    def initialize(numero_estrellas)
        @stars_array = generar_stars_array(numero_estrellas)
    end

    def draw_all
        @stars_array.map { |star| 
            star.draw
        }
    end

    def update_stars_position(window_size_y)
        @stars_array.map { |star| 
            if star.position.y > window_size_y
                star.position.y = -50
            else
                star.position.y = star.position.y + 3
            end
            
        }
    end

    private 
    def generar_stars_array(numero_estrellas)
        array = []
        x_position = 0
        y_position = 480
        x_step = 640. / numero_estrellas

        numero_estrellas.times do
            y_position = rand() * 480
            point = Point.new(x_position, y_position)
            point.x = x_position
            point.y = y_position
            star = Star.new(point)
            array.push(star)
            x_position += x_step
        end

        return array
    end
end