require_relative 'renderer'
class Interface
    attr_reader :renderer

    def initialize(renderer = Renderer.new)
        @renderer = renderer
    end

    def start_menu
        @renderer.render_start_menu
        case gets.chomp
        when '1'
            @renderer.render_main_menu
        when '2'
            @renderer.render_quit_message
            exit
        else
            @renderer.render_error_message
        end
    end
end