class Surface
    attr_reader :grid, :x_coord, :y_coord

    def initialize(x_coord, y_coord)
        @x_coord = x_coord
        @y_coord = y_coord
        # Populating a 2D array with Array.new(y_coord, Array.new(x_coord, nil))
        # creates an instance of the same array at each index. Meaning any
        # updates to one sub array affects them all. Wrapping sub array in a block
        # fixes this.
        @grid = Array.new(y_coord) { Array.new(x_coord) { { occupant: nil } } }
    end

    def locate_robot(robot, x_coord, y_coord)
        space_with(robot)[:occupant] = nil if space_with(robot)
        space_at(x_coord, y_coord)[:occupant] = robot if space_at(x_coord, y_coord)
    end

    def locate_scent(scent, robot)
        space_with(robot)[:occupant] = scent if space_with(robot)
    end

private

    def space_with(robot)
        @grid.flatten.find { |space| space[:occupant] == robot }
    end

    def space_at(x_coord, y_coord)
        @grid[y_coord][x_coord]
    end

end