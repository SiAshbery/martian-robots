require 'renderer'

describe Renderer do
    subject(:renderer) { described_class.new }

    describe '#initialize' do
        it 'Exists' do
            expect(renderer).to be_instance_of(described_class)
        end
    end

    describe '#Rendering' do
        it 'renders the start menu options' do
            expect { renderer.render_start_menu }.
              to output("Welcome to Martian Robots!\n"\
                        "Please input a number from the menu to make your selection.\n"\
                        "1: Start a new mission.\n"\
                        "2: Quit.\n").to_stdout
        end

        it 'renders the surface prompt' do
            expect { renderer.render_surface_prompt }.
              to output("Please enter X and Y coordinates for the martian surface area:\n"\
                        "e.g 10 20\n").to_stdout
        end

        it 'renders the error_message' do
            expect { renderer.render_error_message }.
              to output("Sorry I don't recognise that input\n").to_stdout
        end

        it 'renders the quit message' do
            expect { renderer.render_quit_message }.
              to output("Bye!\n").to_stdout
        end
    end
end