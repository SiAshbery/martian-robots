require 'control'

describe Control do
    before(:each) do
        @surface = double(:surface)
        allow(@surface).to receive(:locate_robot)
        allow(@surface).to receive(:locate_scent)
        allow(@surface).to receive(:x_coord).and_return(2)
        allow(@surface).to receive(:y_coord).and_return(3)
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

        it 'Initializes with an empty scents array' do
            expect(@control.scents).to eq([])
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
            expect(@surface).to receive(:locate_robot).with(@robot, 0, 0)
            @control.launch_robot(@robot, 0, 0)
        end
    end

    describe '#instruct_robot' do
        before(:each) do
            @robot = double(:robot)
            allow(@robot).to receive(:move)
            allow(@robot).to receive(:turn)
            allow(@robot).to receive(:mark_as_lost)
            allow(@robot).to receive(:x_coord).and_return(1)
            allow(@robot).to receive(:y_coord).and_return(0)
            allow(@robot).to receive(:orientation).and_return('N')
        end

        it 'Instructs the robot to move forward' do
            expect(@robot).to receive(:move)
            expect(@robot).not_to receive(:turn)
            @control.instruct_robot(@robot, 'F')
        end

        it 'Instructs the robot to turn' do
            expect(@robot).to receive(:turn)
            expect(@robot).not_to receive(:move)
            @control.instruct_robot(@robot, 'R')
        end

        it 'Can recieve multiple instructions' do
            expect(@robot).to receive(:turn).with('R').exactly(2).times
            expect(@robot).to receive(:turn).with('L').exactly(2).times
            expect(@robot).to receive(:move).exactly(2).times
            @control.instruct_robot(@robot, 'RLFRLF')
        end

        it 'Will not process invalid instructions' do
            expect(@robot).not_to receive(:turn)
            expect(@robot).not_to receive(:move)
            @control.instruct_robot(@robot, 'beepboop')
        end

        it 'Updates robot position on surface' do
            expect(@surface).to receive(:locate_robot).with(@robot, @robot.x_coord, @robot.y_coord)
            @control.instruct_robot(@robot, 'F')
        end

        describe 'Going out of bounds' do
            before(:each) do
                allow(@robot).to receive(:x_coord).and_return(4)
            end

            it 'Marks a robot as lost if it goes out of bounds' do
                expect(@robot).to receive(:mark_as_lost)
                expect(@surface).not_to receive(:locate_robot)
                @control.instruct_robot(@robot, 'F')
            end
    
            it 'Locates a scent on the surface if robot goes out of bounds' do
                expect(@surface).to receive(:locate_scent)
                @control.instruct_robot(@robot, 'F')
            end
    
            it 'Adds a scent to scents if robot goes out of bounds' do
                expect(@control.scents.length).to eq(0)
                @control.instruct_robot(@robot, 'F')
                expect(@control.scents.length).to eq(1)
            end
            
            it 'Will not issue move command if scent suggest danger' do
                expect(@robot).to receive(:move)
                @control.instruct_robot(@robot, 'F')
                expect(@robot).not_to receive(:move)
                @control.instruct_robot(@robot, 'F')
            end

            it 'Will issue move command if scent suggest danger' do
                second_robot = double(:robot)
                allow(second_robot).to receive(:x_coord).and_return(1)
                allow(second_robot).to receive(:y_coord).and_return(0)
                allow(second_robot).to receive(:orientation).and_return('E')
                @control.instruct_robot(@robot, 'F')
                expect(second_robot).to receive(:move)
                @control.instruct_robot(second_robot, 'F')
            end
        end

    end

end