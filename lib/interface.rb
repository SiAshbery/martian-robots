require_relative 'renderer'
class Interface
    attr_reader :renderer

    def initialize(renderer = Renderer.new)
        @renderer = renderer
    end

    def start_menu
        @renderer.render_start_menu
        if gets.chomp == '1'
            @renderer.render_main_menu
        end
    end
end