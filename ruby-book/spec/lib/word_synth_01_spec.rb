# frozen_string_literal: true

require './spec/spec_helper'
require './lib/word_synth'
require './lib/effects'

RSpec.describe WordSynth do
  subject { synth.play('Ruby is fun!') }
  let(:synth) { WordSynth.new }
  before { effects.each { |effect| synth.add_effect(effect) } }

  context 'without effects' do
    let(:effects) { [] }

    it { is_expected.to eq 'Ruby is fun!' }
  end

  context 'with reverse' do
    let(:effects) { [Effects.reverse] }

    it { is_expected.to eq 'ybuR si !nuf' }
  end

  context 'with many effects' do
    let(:effects) { [Effects.echo(2), Effects.loud(3), Effects.reverse] }

    it { is_expected.to eq '!!!YYBBUURR !!!SSII !!!!!NNUUFF' }
  end
end
