# frozen_string_literal: true

require './spec/spec_helper'
require './lib/fizz_buzz'

RSpec.describe 'fizz_buzz' do
  context 'arg is' do
    it '1' do expect(fizz_buzz(1)).to eq '1' end
    it '2' do expect(fizz_buzz(2)).to eq '2' end
    it '3' do expect(fizz_buzz(3)).to eq 'Fizz' end
    it '5' do expect(fizz_buzz(5)).to eq 'Buzz' end
    it '15' do expect(fizz_buzz(15)).to eq 'Fizz Buzz' end
  end
end
