require 'robot'

describe Robot do
    before(:each) do
        @x_coord = 0
        @robot = described_class.new(@x_coord)
    end

    describe '#initialize' do
        it 'Exists' do
            expect(@robot).to be_instance_of(described_class)
        end

        it 'Initializes with an x_coord' do
            expect(@robot.x_coord).to eq(@x_coord)
        end
    end
end