require 'surface'
class Control
    attr_reader :surface

    def launch_mission(x_coord, y_coord)
        @surface = Surface.new(x_coord, y_coord)
    end
   
end