require 'renderer'

describe Renderer do
    subject(:renderer) { described_class.new }

    describe '#initialize' do
        it 'Exists' do
            expect(renderer).to be_instance_of(described_class)
        end
    end

    describe '#Start menu' do
        it 'renders the start menu options' do
            expect { renderer.render_start_menu }.
              to output("Welcome to Martian Robots!\n"\
                        "Please input a number from the menu to make your selection.\n"\
                        "1: Start a new mission.\n"\
                        "2: Quit.\n").to_stdout
        end
    end
end