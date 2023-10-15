# frozen_string_literal: true

require 'rails_helper'

describe 'mangas' do
  context 'when 正常' do
    before do
      visit '/'
      click_link 'コミックレコメンドロボ'
    end

    it 'with コミックレコメンドロボにアクセスすることができる' do
      expect(page).to have_content('読みたい漫画のジャンルを選択してください。')
    end

    it 'with ジャンルを選択することができる' do
      click_link 'アクション'
      sleep(45)
      expect(page).to have_content('キングダム')
    end

    it 'with Twitterで共有することができる' do
      click_link 'アクション'
      sleep(45)
      new_window = window_opened_by { click_link 'Twitterで共有する' }
      sleep(5)
      within_window new_window do
        expect(page).to have_content 'Xにログイン'
      end
    end

    it 'with 最初からやり直すことができる' do
      click_link 'アクション'
      sleep(45)
      click_link '最初からやり直す'
      expect(page).to have_content('読みたい漫画のジャンルを選択してください。')
    end
  end
end
