require_relative 'renderer'
require_relative 'control'
require_relative 'surface'
class Interface
    attr_reader :renderer

    def initialize(renderer = Renderer.new)
        @renderer = renderer
    end

    def start_new_mission
        @renderer.render_surface_prompt
        input = gets.chomp.split(' ').map(&:to_i)
        @control = Control.new(Surface.new(input[0], input[1]))
        launch_robot
    end

private

    def launch_robot
        @renderer.render_launch_robot_prompt
    end
end