require 'scent'

describe Scent do
    subject(:scent) { described_class.new(0, 1, 'N') }

    before(:each) do
        @x_coord = 0
        @y_coord = 1
        @orientation = 'N'
    end

    describe '#initialize' do
        it 'Exists' do
            expect(scent).to be_instance_of(described_class)
        end

        it 'Initializes with an x_coord' do
            expect(scent.x_coord).to eq(@x_coord)
        end

        it 'Initializes with a y_coord' do
            expect(scent.y_coord).to eq(@y_coord)
        end

        it 'Initializes with an orientation' do
            expect(scent.orientation).to eq(@orientation)
        end
    end
end