require 'control'

describe Control do
    before(:each) do
        @surface = double(:surface)
        @control = described_class.new(@surface)
    end

    describe '#initialize' do
        it 'Exists' do
            expect(@control).to be_instance_of(described_class)
        end

        it 'Initializes with a surface' do
            expect(@control.surface).to eq(@surface)
        end
    end

end