class Robot
    attr_reader :x_coord, :y_coord
    attr_accessor :lost

    def initialize(x_coord, y_coord, orientation)
        @x_coord = x_coord
        @y_coord = y_coord
        @lost = false
        calibrate_compass(orientation)
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

    def move
        case orientation
        when 'N'
            @y_coord += 1
        when 'E'
            @x_coord += 1
        when 'S'
            @y_coord -= 1
        when 'W'
            @x_coord -= 1
        end
    end

private

    def calibrate_compass(orientation)
        @compass = case orientation
                    when 'N'
                        %w[N E S W]
                    when 'E'
                        %w[E S W N]
                    when 'S'
                        %w[S W N E]
                    when 'W'
                        %w[W N E S]
                    end
    end

end