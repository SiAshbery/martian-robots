class Surface
    attr_reader :grid, :x_coord, :y_coord

    def initialize(x_coord, y_coord)
        @x_coord = x_coord
        @y_coord = y_coord
        # Populating a 2D array with Array.new(y_coord, Array.new(x_coord, nil))
        # creates an instance of the same array at each index. Meaning any
        # updates to one sub array affects them all. Wrapping sub array in a block
        # fixes this.
        @grid = Array.new(y_coord) { Array.new(x_coord, nil) }
    end

    def position(robot, x_coord, y_coord)
        @grid[y_coord][x_coord] = robot
    end

end