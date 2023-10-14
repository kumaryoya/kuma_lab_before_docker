# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shogun do
  context 'when 正常' do
    it 'scoreがある場合、有効である' do
      shogun = build(:shogun)
      expect(shogun).to be_valid
    end
  end

  context 'when 異常' do
    context 'with scoreカラム' do
      it '空欄の場合、無効である' do
        shogun = build(:shogun, score: nil)
        shogun.valid?
        expect(shogun.errors[:score]).to include("can't be blank")
      end
    end
  end
end
