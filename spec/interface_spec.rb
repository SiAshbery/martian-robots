require 'interface'
require 'stringio'

describe Interface do
    before(:each) do
        @renderer = double(:renderer)
        allow(@renderer).to receive(:render_start_menu)
        @interface = described_class.new(@renderer)
    end

    describe '#initialize' do
        it 'Exists' do
            expect(@interface).to be_instance_of(described_class)
        end

        it 'Initializes with a renderer' do
            expect(@interface.renderer).to eq(@renderer)
        end
    end

    describe '#Start' do
        it 'Calls render_start_menu on renderer' do
            expect(@renderer).to receive(:render_start_menu)
            @interface.start_menu
        end

        it 'Renders main menu if user selects 1' do
            $stdin = StringIO.new("1\n")
            expect(@renderer).to receive(:render_main_menu)
            @interface.start_menu
            $stdin = STDIN
        end
    end

end