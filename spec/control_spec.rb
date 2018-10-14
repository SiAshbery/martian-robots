require 'control'

describe Control do
    subject(:control) { described_class.new }

    describe '#initialize' do
        it 'Exists' do
            expect(control).to be_instance_of(described_class)
        end
    end

end