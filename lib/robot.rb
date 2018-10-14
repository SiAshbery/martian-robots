class Robot
    attr_reader :x_coord, :y_coord

    def initialize(x_coord, y_coord, orientation)
        @x_coord = x_coord
        @y_coord = y_coord
        @compass = %w[N E S W]
    end

    def orientation
        @compass[0]
    end

    def turn(direction)
        if direction == 'R'
            @compass.rotate!(1)
        elsif direction == 'L'
            @compass.rotate!(-1)
        end
    end

end