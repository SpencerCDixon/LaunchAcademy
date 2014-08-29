require 'rspec'
require_relative '../minefield'

describe Minefield do

  let(:minefield) { Minefield.new(5,5,3) }

  describe '#cells_cleared?' do

    it 'returns false for a cell that has not been clicked' do
      expect(minefield.cell_cleared?(0,0)).to be_false
    end
  end

end
