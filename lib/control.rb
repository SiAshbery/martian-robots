require 'surface'
class Control
    attr_reader :surface, :robots

    def initialize(surface)
        @surface = surface
        @robots = []
    end

    def launch_robot(robot, x_coord, y_coord)
        @robots << robot
        @surface.position(robot, x_coord, y_coord)
    end

    def instruct_robot(robot, commands)
        robot.move
    end
   
end