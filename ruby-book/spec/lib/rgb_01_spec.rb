# frozen_string_literal: true

require './spec/spec_helper'
require './lib/rgb'

RSpec.describe 'RGB' do
  describe '#to_hex' do
    it 'returns valid string' do
      expect(to_hex(0, 0, 0)).to eq '#000000'
      expect(to_hex(255, 255, 255)).to eq '#ffffff'
      expect(to_hex(4, 60, 120)).to eq '#043c78'
    end

    it 'exception for invalid value' do
      expect { to_hex(0, 0, 256) }
        .to raise_error(ArgumentError, 'invalid value: 256')
    end
  end

  describe '#to_ints' do
    it 'returns valid array' do
      expect(to_ints('#000000')).to eq [0, 0, 0]
      expect(to_ints('#ffffff')).to eq [255, 255, 255]
      expect(to_ints('#043c78')).to eq [4, 60, 120]
      expect(to_ints('#FFFFFF')).to eq [255, 255, 255]
    end

    it 'exception for invalid string' do
      expect { to_ints('#12345') }
        .to raise_error(ArgumentError, 'invalid format')
      expect { to_ints('%123456') }
        .to raise_error(ArgumentError, 'invalid format')
      expect { to_ints('%1234FG') }
        .to raise_error(ArgumentError, 'invalid format')
    end
  end
end
