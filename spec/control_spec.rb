require 'control'
require 'surface'

describe Control do
    subject(:control) { described_class.new }

    describe '#initialize' do
        it 'Exists' do
            expect(control).to be_instance_of(described_class)
        end
    end

    describe '#launch_mission' do
        it 'creates a surface object' do
            expect(control.surface).to be_nil
            control.launch_mission(5,5)
            expect(control.surface).to be_instance_of(Surface)
        end
    end

end