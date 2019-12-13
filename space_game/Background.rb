class Background
    
    def initialize(numero_estrellas)
        @stars_array = generar_stars_array(numero_estrellas)
    end

    private 
    def generar_stars_array(numero_estrellas)
        array = []
        x_position = 0
        y_position = 480
        x_step = 640. / numero_estrellas
        point = Point.new(x_position, y_position)

        numero_estrellas.times do
            y_position = rand() * 480
            point.x = x_position
            point.y = y_position
            star = Star.new(point)
            array.push(star)
            x_position += x_step
        end

        return array
    end
end