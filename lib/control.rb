require_relative 'surface'
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
        commands.split('').each do |command|
            if command == 'F'
                robot.move
                @surface.position(robot, robot.x_coord, robot.y_coord)
            elsif command == 'L' || command == 'R'
                robot.turn(command)
            end
        end
    end
   
end