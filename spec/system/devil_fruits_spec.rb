# frozen_string_literal: true

require 'rails_helper'

describe 'devil_fruits' do
  context 'when 正常' do
    before do
      visit '/'
      click_link 'DevilFruitApp'
    end

    it 'with devil_fruitsにアクセスすることができる' do
      expect(page).to have_content('お前は悪魔の実を知っているか？')
    end

    it 'with 悪魔の実を食べることができる' do
      fill_in 'name', with: 'テスト'
      click_button '悪魔の実を食べる'
      expect(page).to have_content('テストは')
    end

    it 'with 悪魔の実を調べることができる' do
      fill_in 'name', with: 'テスト'
      click_button '悪魔の実を食べる'
      new_window = window_opened_by { click_link 'とは？' }
      within_window new_window do
        expect(page).to have_content 'の実'
      end
    end

    it 'with Twitterで共有することができる' do
      fill_in 'name', with: 'テスト'
      click_button '悪魔の実を食べる'
      new_window = window_opened_by { click_link 'Twitterで共有する' }
    end

    it 'with もう一つ食べることができる' do
      fill_in 'name', with: 'テスト'
      click_button '悪魔の実を食べる'
      click_link 'もう一つ食べる'
      expect(page).to have_content('体が跡形もなく飛び散った')
    end

    it 'with 最初からやり直すことができる1' do
      fill_in 'name', with: 'テスト'
      click_button '悪魔の実を食べる'
      click_link '最初からやり直す'
      expect(page).to have_content('お前は悪魔の実を知っているか？')
    end

    it 'with 最初からやり直すことができる2' do
      fill_in 'name', with: 'テスト'
      click_button '悪魔の実を食べる'
      click_link 'もう一つ食べる'
      click_link '最初からやり直す'
      expect(page).to have_content('お前は悪魔の実を知っているか？')
    end
  end

  context 'when 異常' do
    before do
      visit '/'
      click_link 'DevilFruitApp'
    end

    it 'with 名前を入力しないと悪魔の実を食べることができない' do
      click_button '悪魔の実を食べる'
      expect(page).to have_content('名前を入力してください')
    end
  end
end
