require 'surface'

describe Surface do

    subject(:surface) { described_class.new }

    describe '#initialize' do
        it 'Exists' do
            expect(surface).to be_instance_of(described_class)
        end

        it 'Has a grid' do
            expect(surface.grid).to be
        end
    end

    describe '#grid' do
        it 'is an array' do
            expect(surface.grid).to be_instance_of(Array)
        end

        it 'is a two dimensional array' do
            expect(surface.grid[0]).to be_instance_of(Array)
        end
    end

end