# frozen_string_literal: true

require 'rails_helper'

describe 'devil_fruits' do
  context 'when 正常' do
    before do
      visit '/'
      click_link 'DevilFruitApp'
    end

    it 'with DevilFruitAppにアクセスすることができる' do
      expect(page).to have_content('お前は悪魔の実を知っているか？')
      expect(page).to have_current_path devil_fruits_path, ignore_query: true
    end

    it 'with 悪魔の実を食べることができる' do
      fill_in 'name', with: 'テスト'
      click_button '悪魔の実を食べる'
      expect(page).to have_content('テストは')
      expect(page).to have_current_path result_devil_fruits_path, ignore_query: true
    end

    it 'with 悪魔の実を調べることができる' do
      fill_in 'name', with: 'テスト'
      click_button '悪魔の実を食べる'
      new_window = window_opened_by { click_link 'とは？' }
      sleep(5)
      within_window new_window do
        expect(page).to have_content 'の実'
      end
      expect(page).to have_current_path result_devil_fruits_path, ignore_query: true
    end

    it 'with Twitterで共有することができる' do
      fill_in 'name', with: 'テスト'
      click_button '悪魔の実を食べる'
      new_window = window_opened_by { click_link 'Twitterで共有する' }
      sleep(5)
      within_window new_window do
        expect(page).to have_content 'Xにログイン'
      end
      expect(page).to have_current_path result_devil_fruits_path, ignore_query: true
    end

    it 'with もう一つ食べることができる' do
      fill_in 'name', with: 'テスト'
      click_button '悪魔の実を食べる'
      click_link 'もう一つ食べる'
      expect(page).to have_content('体が跡形もなく飛び散った')
      expect(page).to have_current_path crush_devil_fruits_path, ignore_query: true
    end

    it 'with 最初からやり直すことができる1' do
      fill_in 'name', with: 'テスト'
      click_button '悪魔の実を食べる'
      click_link '最初からやり直す'
      expect(page).to have_content('お前は悪魔の実を知っているか？')
      expect(page).to have_current_path devil_fruits_path, ignore_query: true
    end

    it 'with 最初からやり直すことができる2' do
      fill_in 'name', with: 'テスト'
      click_button '悪魔の実を食べる'
      click_link 'もう一つ食べる'
      click_link '最初からやり直す'
      expect(page).to have_content('お前は悪魔の実を知っているか？')
      expect(page).to have_current_path devil_fruits_path, ignore_query: true
    end
  end

  context 'when 異常' do
    it 'with 名前を入力しないと悪魔の実を食べることができない' do
      visit '/'
      click_link 'DevilFruitApp'
      click_button '悪魔の実を食べる'
      expect(page).to have_content('名前を入力してください')
      expect(page).to have_current_path result_devil_fruits_path, ignore_query: true
    end
  end
end
