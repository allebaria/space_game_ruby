require "gosu"
require "./Background"
require "./Star"
require "./Point"
require "./Ship"
require "./Bullet"
require "./utils"


class GameWindow < Gosu::Window

  def initialize
    super(640, 480, false)
    self.caption = "Space Shooter"
    @myBack = Background.new(10)
    @myShip = Ship.new(320, 300)
    @bullets_array = []
    @last_shoot_time = Time.now
    @reload_shoot_delay = 0.25 #seconds
  end

  def draw
    @myBack.draw_all
    @myShip.draw
    self.draw_bullets
  end

  def update
    #Actualizar background
    @myBack.update_stars_position(480)

    #Actualizar nave
    self.update_ship

    #Update Bullets
    self.update_bullets

    #Add new Bullet if necessary
    self.add_new_bullet
    
  end

  #SHIP METHODS
  def update_ship
    #Posición horizontal
    if @myShip.position.x + @myShip.width/2 < 640
        if button_down? Gosu::KbRight
            @myShip.move_right
        end
    end
    if @myShip.position.x - @myShip.width/2 > 0
        if button_down? Gosu::KbLeft
            @myShip.move_left
        end    
    end
    #Posición vertical
    if @myShip.position.y + @myShip.height/2 < 480
        if button_down? Gosu::KbDown
            @myShip.move_down
        end
    end

    if @myShip.position.y - @myShip.height/2 > 0
        if button_down? Gosu::KbUp
            @myShip.move_up
        end
    end

    #Si no se mueve frenalo poco a poco

    #Ángulo de rotación
    if @myShip.rotation_angle < 30
        if button_down? Gosu::KbRight
            @myShip.rotate_right
        end
    end
    if @myShip.rotation_angle > -30
        if button_down? Gosu::KbLeft
            @myShip.rotate_left
        end
    end
    if @myShip.rotation_angle < 0
        if !(button_down? Gosu::KbLeft)
            @myShip.rotate_right
        end
    end
    if @myShip.rotation_angle > 0
        if !(button_down? Gosu::KbRight)
            @myShip.rotate_left
        end
    end
  end

  #BULLET METHODS
  def add_new_bullet
    new_shoot_time = Time.now
    is_bullet_reloaded = (new_shoot_time - @last_shoot_time > @reload_shoot_delay)

    #Solo se puede añadir una nueva bala cada @reload_shoot_delay segundos
    if is_bullet_reloaded
        if button_down? Gosu::KbSpace
            new_bullet = Bullet.new(bullet_initial_position.x, bullet_initial_position.y, @myShip.rotation_angle)
            @bullets_array.push(new_bullet)
            @last_shoot_time = new_shoot_time
        end
    end
  end

  def draw_bullets
    @bullets_array.map { |bullet| bullet.draw }
  end

  def update_bullets
    @bullets_array.map { |bullet| 
        bullet.update 
    }
  end

  def bullet_initial_position
    x_position = @myShip.position.x + (5 + @myShip.height/2)*Math.sin(degree_to_rad(@myShip.rotation_angle))
    y_position = @myShip.position.y - (5 + @myShip.height/2)*Math.cos(degree_to_rad(@myShip.rotation_angle))
    initial_position = Point.new(x_position, y_position)
  end

  
end

window = GameWindow.new
window.show
