require 'control'

describe Control do
    before(:each) do
        @surface = double(:surface)
        allow(@surface).to receive(:position)
        @control = described_class.new(@surface)
    end

    describe '#initialize' do
        it 'Exists' do
            expect(@control).to be_instance_of(described_class)
        end

        it 'Initializes with a surface' do
            expect(@control.surface).to eq(@surface)
        end

        it 'Initializes with an empty robots array' do
            expect(@control.robots).to eq([])
        end
    end

    describe '#launch_robot' do
        before(:each) do
            @robot = double(:robot)
        end

        it 'Adds robot to robots' do
            @control.launch_robot(@robot, 0, 0)
            expect(@control.robots).to include(@robot)
        end

        it 'Calls position on surface' do
            expect(@surface).to receive(:position).with(@robot, 0, 0)
            @control.launch_robot(@robot, 0, 0)
        end
    end

end