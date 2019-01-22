# frozen_string_literal: true

require './spec/spec_helper'
require './lib/gate'
require './lib/ticket'

RSpec.describe 'Gate' do
  subject do
    from_gate.enter(ticket)
    to_gate.exit(ticket)
  end

  context 'exit' do
    [
      { from: :umeda, to: :juso, fare: 150, result: true },
      { from: :umeda, to: :juso, fare: 140, result: false },
      { from: :umeda, to: :juso, fare: 160, result: true },
      { from: :umeda, to: :mikuni, fare: 190, result: true },
      { from: :umeda, to: :mikuni, fare: 180, result: false },
      { from: :juso, to: :mikuni, fare: 150, result: true },
      { from: :juso, to: :mikuni, fare: 140, result: false },
      # 反対向きの乗車
      { from: :juso, to: :umeda, fare: 150, result: true },
      { from: :juso, to: :umeda, fare: 140, result: false },
      # 駅に入場するだけ
      { from: :umeda, to: :umeda, fare: 0, result: false }
    ].each do |test_case|
      context "#{test_case[:from]}->#{test_case[:to]} by #{test_case[:fare]}" do
        let(:from_gate) { Gate.new(test_case[:from]) }
        let(:to_gate) { Gate.new(test_case[:to]) }
        let(:ticket) { Ticket.new(test_case[:fare]) }
        let(:expected_result) { test_case[:result] }

        it { is_expected.to eq expected_result }
      end
    end
  end

  context 'initializer' do
    context 'with invalid name' do
      it do
        expect { Gate.new(:xxx) }
          .to raise_error(ArgumentError, 'invalid name: xxx')
      end
    end
  end
end
