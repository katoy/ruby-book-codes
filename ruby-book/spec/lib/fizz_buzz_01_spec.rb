# frozen_string_literal: true

require './spec/spec_helper'
require './lib/fizz_buzz'

RSpec.describe 'fizz_buzz' do
  subject { fizz_buzz(arg) }

  [
    [1, '1'],
    [2, '2'],
    [3, 'Fizz'],
    [5, 'Buzz'],
    [15, 'Fizz Buzz']
  ].each do |test_case|
    context "arg is #{test_case[0]}" do
      let(:arg) { test_case[0] }
      let(:expect_result) { test_case[1] }

      it { is_expected.to eq expect_result }
    end
  end
end
