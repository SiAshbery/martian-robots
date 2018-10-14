require_relative 'space'
class Surface
    attr_reader :grid, :x_coord, :y_coord
    MAX_LENGTH = 50

    def initialize(x_coord, y_coord)
        @x_coord = capped_length(x_coord)
        @y_coord = capped_length(y_coord)
        # Populating a 2D array with Array.new(y_coord, Array.new(x_coord, nil))
        # creates an instance of the same array at each index. Meaning any
        # updates to one sub array affects them all. Wrapping sub array in a block
        # fixes this.
        @grid = Array.new(y_coord) { Array.new(x_coord) { Space.new } }
    end

    def locate_robot(robot, x_coord, y_coord)
        space_with(robot).robot = nil if space_with(robot)
        space_at(x_coord, y_coord).robot = robot if space_at(x_coord, y_coord)
    end

    def locate_scent(scent, robot)
        space_with(robot).add_scent(scent) if space_with(robot)
    end

private

    def capped_length(length)
        length > MAX_LENGTH ? MAX_LENGTH : length
    end

    def space_with(robot)
        @grid.flatten.find { |space| space.robot == robot }
    end

    def space_at(x_coord, y_coord)
        @grid[y_coord][x_coord]
    end

end