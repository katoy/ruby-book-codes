# frozen_string_literal: true

require './spec/spec_helper'
require './lib/effects'

RSpec.describe Effects do
  subject { effect.call('Ruby is fun!') }

  describe '.reverse' do
    let(:effect) { Effects.reverse }
    let(:expected_str) { 'ybuR si !nuf' }

    it { is_expected.to eq expected_str }
  end

  describe '.echo' do
    [
      [0, ''],
      [1, 'Ruby is fun!'],
      [2, 'RRuubbyy iiss ffuunn!!'],
      [3, 'RRRuuubbbyyy iiisss fffuuunnn!!!']
    ].each do |test_case|
      context "rate is #{test_case[0]}" do
        let(:effect) { Effects.echo(test_case[0]) }
        let(:expected_str) { test_case[1] }

        it { is_expected.to eq expected_str }
      end
    end
  end

  describe '.loud' do
    [
      [0, 'RUBY IS FUN!'],
      [1, 'RUBY! IS! FUN!!'],
      [2, 'RUBY!! IS!! FUN!!!'],
      [3, 'RUBY!!! IS!!! FUN!!!!']
    ].each do |test_case|
      context "level is #{test_case[0]}" do
        let(:effect) { Effects.loud(test_case[0]) }
        let(:expected_str) { test_case[1] }

        it { is_expected.to eq expected_str }
      end
    end
  end
end
