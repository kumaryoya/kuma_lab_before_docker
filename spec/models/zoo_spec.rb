# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Zoo do
  context 'when 正常' do
    it 'name, location, area, prefecture, linkがあり、一意である場合、有効である' do
      zoo = build(:zoo)
      expect(zoo).to be_valid
    end
  end

  context 'when 異常' do
    context 'with nameカラム' do
      it '空欄の場合、無効である' do
        zoo = build(:zoo, name: nil)
        zoo.valid?
        expect(zoo.errors[:name]).to include("can't be blank")
      end

      it '重複している場合、無効である' do
        zoo1 = create(:zoo)
        zoo2 = build(:zoo, name: zoo1.name)
        zoo2.valid?
        expect(zoo2.errors[:name]).to include('has already been taken')
      end
    end

    context 'with locationカラム' do
      it '空欄の場合、無効である' do
        zoo = build(:zoo, location: nil)
        zoo.valid?
        expect(zoo.errors[:location]).to include("can't be blank")
      end

      it '重複している場合、無効である' do
        zoo1 = create(:zoo)
        zoo2 = build(:zoo, location: zoo1.location)
        zoo2.valid?
        expect(zoo2.errors[:location]).to include('has already been taken')
      end
    end
  end
end
