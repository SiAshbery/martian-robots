require 'surface'
class Control
    attr_reader :surface, :robots

    def initialize(surface)
        @surface = surface
        @robots = []
    end

    def launch_robot(robot)
        @robots << robot
    end
   
end