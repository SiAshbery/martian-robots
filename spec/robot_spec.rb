require 'robot'

describe Robot do
    subject(:robot) { described_class.new }

    describe '#initialize' do
        it 'Exists' do
            expect(robot).to be_instance_of(described_class)
        end
    end
end