require 'robot'

describe Robot do
    subject(:robot) { described_class.new(0, 1, 'N') }

    before(:each) do
        @x_coord = 0
        @y_coord = 1
        @orientation = 'N'
    end

    describe '#initialize' do
        it 'Exists' do
            expect(robot).to be_instance_of(described_class)
        end

        it 'Initializes with an x_coord' do
            expect(robot.x_coord).to eq(@x_coord)
        end

        it 'Initializes with a y_coord' do
            expect(robot.y_coord).to eq(@y_coord)
        end

        it 'Initializes with an orientation' do
            expect(robot.orientation).to eq(@orientation)
        end
    end

    describe '#turn' do
        it 'turns to the right' do
            robot.turn('R')
            expect(robot.orientation).to eq('E')
        end

        it 'turns to the left' do
            robot.turn('L')
            expect(robot.orientation).to eq('W')
        end

        it 'faces south if it turns twice' do
            2.times { robot.turn('R') }
            expect(robot.orientation).to eq('S')
        end
    end
end