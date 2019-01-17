# frozen_string_literal: true

require './spec/spec_helper'
require './lib/bank'
require './lib/team'

RSpec.describe 'Deep freezable' do
  describe 'to array' do
    it 'freezes deeply' do
      # 配列の値は正しいか？
      expect(Team::COUNTRIES).to eq %w[Japan US India]
      # 配列自身がfreezeされているか？
      expect(Team::COUNTRIES).to be_frozen
      # 配列の要素がすべてfreezeされているか？
      expect(Team::COUNTRIES.all?(&:frozen?)).to be_truthy
    end
  end

  describe 'to hash' do
    it 'freezes deeply' do
      # ハッシュの値は正しいか？
      expect(Bank::CURRENCIES)
        .to eq({ 'Japan' => 'yen', 'US' => 'dollar', 'India' => 'rupee' })
      # ハッシュ自身がfreezeされているか？
      expect(Bank::CURRENCIES).to be_frozen
      # ハッシュの要素（キーと値）がすべてfreezeされているか？
      expect(Bank::CURRENCIES.keys.all?(&:frozen?)).to be_truthy
      expect(Bank::CURRENCIES.values.all?(&:frozen?)).to be_truthy
    end
  end
end
