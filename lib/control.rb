require 'surface'
class Control
    attr_reader :surface, :robots

    def initialize(surface)
        @surface = surface
        @robots = []
    end
   
end