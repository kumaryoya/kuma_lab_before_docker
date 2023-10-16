# frozen_string_literal: true

require 'rails_helper'

describe 'shoguns' do
  context 'when 正常' do
    before do
      visit '/'
      click_link '天下の大将軍診断'
    end

    it 'with 天下の大将軍診断にアクセスすることができる' do
      expect(page).to have_content('診断したい顔が写っている画像を選択してください')
      expect(page).to have_current_path new_shogun_path, ignore_query: true
    end

    it 'with 診断することができる' do
      attach_file 'image', Rails.root.join('spec/factories/shoguns1.png')
      click_button '診断'
      expect(page).to have_content('88点でした')
      expect(page).to have_current_path shogun_path(1), ignore_query: true
    end

    it 'with Twitterで共有することができる' do
      attach_file 'image', Rails.root.join('spec/factories/shoguns1.png')
      click_button '診断'
      new_window = window_opened_by { click_link 'Twitterで共有する' }
      sleep(5)
      within_window new_window do
        expect(page).to have_content 'Xにログイン'
      end
      expect(page).to have_current_path shogun_path(1), ignore_query: true
    end

    it 'with 最初からやり直すことができる' do
      attach_file 'image', Rails.root.join('spec/factories/shoguns1.png')
      click_button '診断'
      click_link '最初からやり直す'
      expect(page).to have_content('診断したい顔が写っている画像を選択してください')
      expect(page).to have_current_path new_shogun_path, ignore_query: true
    end
  end

  context 'when 異常' do
    before do
      visit '/'
      click_link '天下の大将軍診断'
    end

    it 'with 画像を選択しないと診断することができない' do
      click_button '診断'
      expect(page).to have_content('画像を選択してください')
      expect(page).to have_current_path new_shogun_path, ignore_query: true
    end

    it 'with 顔が複数写っている画像だと診断することができない' do
      attach_file 'image', Rails.root.join('spec/factories/shoguns2.png')
      click_button '診断'
      expect(page).to have_content('複数の顔が検出されました')
      expect(page).to have_current_path new_shogun_path, ignore_query: true
    end

    it 'with 顔が写っていない画像だと診断することができない' do
      attach_file 'image', Rails.root.join('spec/factories/shoguns3.png')
      click_button '診断'
      expect(page).to have_content('顔が検出できませんでした')
      expect(page).to have_current_path new_shogun_path, ignore_query: true
    end
  end
end
