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
                update_surface(robot)
            elsif command == 'L' || command == 'R'
                robot.turn(command)
            end
        end
    end

private

    def movement_in_bounds(x_coord, y_coord)
        x_coord <= @surface.x_coord && y_coord <= @surface.y_coord
    end

    def update_surface(robot)
        if movement_in_bounds(robot.x_coord, robot.y_coord)
            @surface.position(robot, robot.x_coord, robot.y_coord)
        else
            robot.mark_as_lost
        end
    end
   
end