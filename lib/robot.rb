class Robot
    attr_reader :x_coord, :y_coord, :orientation

    def initialize(x_coord, y_coord, orientation)
        @x_coord = x_coord
        @y_coord = y_coord
        @orientation = orientation
    end

    def turn(direction)
        if direction == 'R'
            @orientation = 'E'
        else
            @orientation = 'W'
        end
    end

end