class Robot
    attr_reader :x_coord, :y_coord

    def initialize(x_coord, y_coord, orientation)
        @x_coord = x_coord
        @y_coord = y_coord
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
        if orientation == 'N'
            @y_coord += 1
        else
            @x_coord += 1
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