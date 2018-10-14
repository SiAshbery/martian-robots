require 'interface'

describe Interface do
    before(:each) do
        @renderer = double(:renderer)
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

end