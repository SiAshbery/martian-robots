require_relative 'renderer'
class Interface
    attr_reader :renderer

    def initialize(renderer = Renderer.new)
        @renderer = renderer
        start_menu
    end

private

    def start_menu
        @renderer.render_start_menu
    end
end