require 'space'

describe Space do
    subject(:space) { described_class.new }

    describe '#initialize' do
        it 'Exists' do
            expect(space).to be_instance_of(described_class)
        end

        it 'Initializes with an empty scents array' do
            expect(space.scents).to eq([])
        end
    end

    describe '#Robot' do
        it 'Can have a robot' do
            robot = double(:robot)
            space.robot = robot
            expect(space.robot).to eq (robot)
        end
    end

    describe '#Add_scent' do
        it 'Can add scents' do
            scent = double(:scent)
            space.add_scent(scent)
            expect(space.scents).to include(scent)
        end
    end
end