class Surface
    attr_reader :grid, :x_coord

    def initialize(x_coord)
        @x_coord = x_coord
        @grid = [[]]
    end 

end