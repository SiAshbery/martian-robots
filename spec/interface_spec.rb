require 'interface'

describe Interface do
    subject(:interface) { described_class.new }

    describe '#initialize' do
        it 'Exists' do
            expect(interface).to be_instance_of(described_class)
        end
    end
end