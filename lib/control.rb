require_relative 'surface'
require_relative 'scent'
class Control
    attr_reader :surface, :robots, :scents

    def initialize(surface)
        @surface = surface
        @robots = []
        @scents = []
    end

    def launch_robot(robot, x_coord, y_coord)
        @robots << robot
        @surface.locate_robot(robot, x_coord, y_coord)
    end

    def instruct_robot(robot, commands)
        commands.split('').each do |command|
            if command == 'F' && safe_to_move?(robot)
                scent = Scent.new(robot.x_coord, robot.y_coord, robot.orientation)
                robot.move
                update_surface(robot, scent)
            elsif command == 'L' || command == 'R'
                robot.turn(command)
            end
        end
    end

private

    def safe_to_move?(robot)
        @scents.find do |scent|
            scent.x_coord == robot.x_coord
            scent.y_coord == robot.y_coord
            scent.orientation == robot.orientation
        end.nil?
    end

    def movement_in_bounds(x_coord, y_coord)
        x_coord <= @surface.x_coord && y_coord <= @surface.y_coord
    end

    def update_surface(robot, scent)
        if movement_in_bounds(robot.x_coord, robot.y_coord)
            @surface.locate_robot(robot, robot.x_coord, robot.y_coord)
        else
            robot.mark_as_lost
            @surface.locate_scent(scent, robot)
            @scents << scent
        end
    end
   
end