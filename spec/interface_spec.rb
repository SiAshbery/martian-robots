require 'interface'
require 'stringio'

describe Interface do
    before(:each) do
        @renderer = double(:renderer)
        allow(@renderer).to receive(:render_start_menu)
        allow(@renderer).to receive(:render_surface_prompt)
        allow(@renderer).to receive(:render_quit_message)
        allow(@renderer).to receive(:render_error_message)
        @interface = described_class.new(@renderer)
    end

    after(:all) do
        $stdin = STDIN
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
        # it 'Calls render_start_menu on renderer' do
        #     expect(@renderer).to receive(:render_start_menu)
        #     @interface.start_menu
        # end
    end

end