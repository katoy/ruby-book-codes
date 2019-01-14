# frozen_string_literal: true

require './spec/spec_helper'
require './lib/convert_hash_syntax'

RSpec.describe 'convert_hash_syntax' do
  subject { convert_hash_syntax(old_syntax) }
  let(:old_syntax) do
    <<~TEXT
      {
        :name => 'Alice',
        :age=>20,
        :gender   =>   :female
      }
    TEXT
  end
  let(:expected) do
    <<~TEXT
      {
        name: 'Alice',
        age: 20,
        gender: :female
      }
    TEXT
  end

  it { convert_hash_syntax(old_syntax) }
end
