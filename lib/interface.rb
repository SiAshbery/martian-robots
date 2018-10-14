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
            start_new_mission
            return
        when '2'
            @renderer.render_quit_message
            exit
        else
            @renderer.render_error_message
            start_menu
            return
        end
        return
    end

private

    def start_new_mission
        @renderer.render_surface_prompt
        input = gets.chomp
    end
end