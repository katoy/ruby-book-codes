# frozen_string_literal: true

require './spec/spec_helper'
require './lib/convert_length'

RSpec.describe 'Convert length' do
  it 'returns valid value' do
    expect(convert_length(1, from: :m, to: :in)).to eq 39.37
    expect(convert_length(15, from: :in, to: :m)).to eq 0.38
    expect(convert_length(35_000, from: :ft, to: :m)).to eq 10_670.73

    expect(convert_length(1)).to eq 1.00
    expect(convert_length(1, from: :in)).to eq 0.03
    expect(convert_length(1, to: :in)).to eq 39.37
  end

  it 'invalid unit' do
    expect { convert_length(1, from: :g, to: :in) }
      .to raise_error(ArgumentError, 'invalid unit: g')
    expect { convert_length(1, from: :m, to: :km) }
      .to raise_error(ArgumentError, 'invalid unit: km')
  end
end
