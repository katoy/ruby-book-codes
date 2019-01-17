# frozen_string_literal: true

require './spec/spec_helper'
require './lib/deep_freezable'

RSpec.describe 'Deep freezable' do
  class Foo
    include DeepFreezable
  end

  shared_examples 'check frozen obj' do |obj|
    context 'self is frozen' do
      it { expect(obj).to be_frozen }
    end

    case obj
    when Array
      context 'all elems are froen' do
        it { expect(obj.all?(&:frozen?)).to be_truthy }
      end
    when Hash
      context 'all keys and values are frozen' do
        it { expect(obj.keys.all?(&:frozen?)).to be_truthy }
        it { expect(obj.values.all?(&:frozen?)).to be_truthy }
      end
    end
  end

  context 'to array' do
    it_behaves_like 'check frozen obj',
                    Foo.new.deep_freeze(%w[Japan US India])
  end

  context 'to Hash' do
    it_behaves_like 'check frozen obj',
                    Foo.new.deep_freeze({ 'Japan' => 'yen', 'US' => 'dollar' })
  end

  context 'to nested array/hash' do
    it_behaves_like(
      'check frozen obj',
      Foo.new.deep_freeze(
        [
          %w[Japan US India],
          [%w[Japan US India]],
          { 'Japan' => 'yen', 'US' => 'dollar' },
          { 'Japan' => %w[yen], 'US' => { unit: %w[dollar] } }
        ]
      )
    )
  end

  context 'to nil' do
    it_behaves_like 'check frozen obj',
                    Foo.new.deep_freeze(nil)
    it_behaves_like 'check frozen obj',
                    Foo.new.deep_freeze([nil])
    it_behaves_like 'check frozen obj',
                    Foo.new.deep_freeze(x: nil)
  end
end
