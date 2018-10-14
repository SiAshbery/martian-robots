require 'renderer'

describe Renderer do
    subject(:renderer) { described_class.new }

    describe '#initialize' do
        it 'Exists' do
            expect(renderer).to be_instance_of(described_class)
        end
    end
end