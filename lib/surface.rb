class Surface
    attr_reader :grid, :x_coord, :y_coord

    def initialize(x_coord, y_coord)
        @x_coord = x_coord
        @y_coord = y_coord
        @grid = Array.new(y_coord, Array.new(x_coord, nil))
    end 

end