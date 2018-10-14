require 'surface'

describe Surface do

    subject(:surface) { described_class.new }

    describe '#initialize' do
        it 'Exists' do
            expect(surface).to be_instance_of(described_class)
        end

        it 'Has a grid' do
            expect(surface.grid).to be
        end
    end

end