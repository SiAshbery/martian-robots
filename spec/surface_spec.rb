require 'surface'

describe Surface do
    before(:each) do
        @x_coord = 2
        @y_coord = 4
        @surface = described_class.new(@x_coord, @y_coord)
    end

    describe '#initialize' do
        it 'Exists' do
            expect(@surface).to be_instance_of(described_class)
        end

        it 'Has a grid' do
            expect(@surface.grid).to be
        end

        it 'Initializes with an x_coord' do
            expect(@surface.x_coord).to eq(@x_coord)
        end

        it 'Initializes with an y_coord' do
            expect(@surface.y_coord).to eq(@y_coord)
        end
    end

    describe '#grid' do
        it 'is an array' do
            expect(@surface.grid).to be_instance_of(Array)
        end

        it 'is a two dimensional array' do
            @surface.grid.each do |row|
                expect(row).to be_instance_of(Array)
            end
        end

        it 'Has its Y length defined during initialize' do
            expect(@surface.grid.length).to eq(@y_coord)
        end

        it 'Has its X length defined during initialize' do
            @surface.grid.each do |row|
                expect(row.length).to eq(@x_coord)
            end
        end
    end

    describe '#position' do
        it 'positions object at specified coordiantes' do
            @surface.position('robot', 0, 1)
            expect(@surface.grid[1][0]).to eq('robot')
        end

        it 'only positions object at specified coordiantes' do
            @surface.position('robot', 0, 1)
            expect(@surface.grid.flatten.count('robot')).to eq(1)
        end
    end

end