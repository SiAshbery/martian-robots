require 'surface'

describe Surface do
    X_COORD = 2
    Y_COORD = 4
    subject(:surface) { described_class.new(X_COORD, Y_COORD) }

    describe '#initialize' do
        it 'Exists' do
            expect(surface).to be_instance_of(described_class)
        end

        it 'Has a grid' do
            expect(surface.grid).to be
        end

        it 'Initializes with an x_coord' do
            expect(surface.x_coord).to eq(X_COORD)
        end

        it 'Initializes with an y_coord' do
            expect(surface.y_coord).to eq(Y_COORD)
        end
    end

    describe '#grid' do
        it 'is an array' do
            expect(surface.grid).to be_instance_of(Array)
        end

        it 'is a two dimensional array' do
            expect(surface.grid[0]).to be_instance_of(Array)
        end

        it 'Has its Y length defined during initialize' do
            expect(surface.grid.length).to eq(Y_COORD)
        end

        it 'Has its X length defined during initialize' do
            expect(surface.grid[0].length).to eq(X_COORD)
        end
    end

end