class Renderer

    def render_start_menu
        puts "Welcome to Martian Robots!\n"\
             "Please input a number from the menu to make your selection.\n"\
             "1: Start a new mission.\n"\
             "2: Quit.\n"
    end

    def render_surface_prompt
        puts "Please enter X and Y coordinates for the martian surface area:\n"\
             "e.g 10 20\n"
    end

    def render_error_message
        puts "Sorry I don't recognise that input\n"
    end

    def render_quit_message
        puts "Bye!\n"
    end
end