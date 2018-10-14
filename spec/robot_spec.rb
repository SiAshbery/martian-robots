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

        it 'Initializes with an orientation orther than N' do
            robot = described_class.new(0, 1, 'E')
            expect(robot.orientation).to eq('E')
        end

        it 'Is not lost when intiailized' do
            expect(robot.lost).to be false
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

        it 'Orients itself correct when initialized facing a direction other than N' do
            robot = described_class.new(0, 1, 'E')
            robot.turn('R')
            expect(robot.orientation).to eq('S')
        end
    end

    describe '#move' do
        it 'When orientated N only moves Y + 1' do
            robot.move
            expect(robot.x_coord).to eq(0)
            expect(robot.y_coord).to eq(2)
        end

        it 'When orientated E only moves X + 1' do
            robot.turn('R')
            robot.move
            expect(robot.x_coord).to eq(1)
            expect(robot.y_coord).to eq(1)
        end

        it 'When orientated S only moves Y - 1' do
            2.times { robot.turn('R') }
            robot.move
            expect(robot.x_coord).to eq(0)
            expect(robot.y_coord).to eq(0)
        end

        it 'When orientated W only moves X - 1' do
            robot.turn('L')
            robot.move
            expect(robot.x_coord).to eq(-1)
            expect(robot.y_coord).to eq(1)
        end
    end

    describe '#lost' do
        it 'Can be lost' do
            robot.mark_as_lost
            expect(robot.lost).to be true
        end
    end
end