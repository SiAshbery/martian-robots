require 'surface'

describe Surface do
    subject(:surface) { described_class.new(2, 4) }

    before(:each) do
        @x_coord = 2
        @y_coord = 4
    end

    describe '#initialize' do
        it 'Exists' do
            expect(surface).to be_instance_of(described_class)
        end

        it 'Has a grid' do
            expect(surface.grid).to be
        end

        it 'Initializes with an x_coord' do
            expect(surface.x_coord).to eq(@x_coord)
        end

        it 'Initializes with an y_coord' do
            expect(surface.y_coord).to eq(@y_coord)
        end

        it 'Will cap x_coord at 50' do
            surface = described_class.new(51, 4)
            expect(surface.x_coord).to eq(50)
        end

        it 'Will cap y_coord at 50' do
            surface = described_class.new(4, 51)
            expect(surface.y_coord).to eq(50)
        end
    end

    describe '#grid' do
        it 'is an array' do
            expect(surface.grid).to be_instance_of(Array)
        end

        it 'is a two dimensional array' do
            surface.grid.each do |row|
                expect(row).to be_instance_of(Array)
            end
        end

        it 'Has its Y length defined during initialize' do
            expect(surface.grid.length).to eq(@y_coord)
        end

        it 'Has its X length defined during initialize' do
            surface.grid.each do |row|
                expect(row.length).to eq(@x_coord)
            end
        end
    end

    describe '#locate_robot' do
        before(:each) do
            @robot = double(:robot)
            allow(@robot).to receive(:mark_as_lost)
        end
        it 'positions object at specified coordiantes' do
            surface.locate_robot(@robot, 0, 1)
            expect(surface.grid[1][0].robot).to eq(@robot)
        end

        it 'only positions object at specified coordiantes' do
            surface.locate_robot(@robot, 0, 1)
            expect(surface.grid.flatten.count{ |space| space.robot == @robot }).to eq(1)
        end

        it 'Removes reference of robot from its old position' do
            surface.locate_robot(@robot, 0, 1)
            surface.locate_robot(@robot, 0, 2)
            expect(surface.grid.flatten.count{ |space| space.robot == @robot }).to eq(1)
            expect(surface.grid[2][0].robot).to eq(@robot)
        end
    end

    describe '#locate_scent' do
        before(:each) do
            @scent = double(:scent)
            @robot = double(:robot)
            surface.locate_robot(@robot, 0, 1)
        end

        it 'locates a scent at the given location' do
            surface.locate_scent(@scent, @robot)
            expect(surface.grid[1][0].scents).to include(@scent)
        end

        it 'can have two scents on a space' do
            second_scent = double(:scent)
            surface.locate_scent(@scent, @robot)
            surface.locate_scent(second_scent, @robot)
            expect(surface.grid[1][0].scents).to include(@scent)
            expect(surface.grid[1][0].scents).to include(second_scent)
        end
    end


end