# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  context 'when 正常' do
    it 'title, poster_path, release_date, overviewがある場合、有効である' do
      movie = build(:movie)
      expect(movie).to be_valid
    end
  end

  context 'when 異常' do
    context 'with titleカラム' do
      it '空欄の場合、無効である' do
        movie = build(:movie, title: nil)
        movie.valid?
        expect(movie.errors[:title]).to include("can't be blank")
      end
    end

    context 'with poster_pathカラム' do
      it '空欄の場合、無効である' do
        movie = build(:movie, poster_path: nil)
        movie.valid?
        expect(movie.errors[:poster_path]).to include("can't be blank")
      end
    end

    context 'with release_dateカラム' do
      it '空欄の場合、無効である' do
        movie = build(:movie, release_date: nil)
        movie.valid?
        expect(movie.errors[:release_date]).to include("can't be blank")
      end
    end

    context 'with overviewカラム' do
      it '空欄の場合、無効である' do
        movie = build(:movie, overview: nil)
        movie.valid?
        expect(movie.errors[:overview]).to include("can't be blank")
      end
    end
  end
end
