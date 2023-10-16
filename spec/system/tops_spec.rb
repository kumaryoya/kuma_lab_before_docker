# frozen_string_literal: true

require 'rails_helper'

describe 'tops' do
  context 'when 正常' do
    before do
      visit '/'
    end

    it 'with トップページにアクセスすることができる' do
      expect(page).to have_content('くまらぼへようこそ')
      expect(page).to have_current_path root_path, ignore_query: true
    end

    it 'with プライバシーポリシーにアクセスすることができる' do
      click_link 'プライバシーポリシー'
      expect(page).to have_content('プライバシーポリシー')
      expect(page).to have_current_path privacy_policy_path, ignore_query: true
    end

    it 'with 利用規約にアクセスすることができる' do
      click_link '利用規約'
      expect(page).to have_content('利用規約')
      expect(page).to have_current_path terms_of_service_path, ignore_query: true
    end

    it 'with お問い合わせフォームにアクセスすることができる' do
      new_window = window_opened_by { click_link 'お問い合わせ' }
      sleep(5)
      within_window new_window do
        expect(page).to have_content '「くまらぼ」のお問い合わせフォーム'
      end
      expect(page).to have_current_path root_path, ignore_query: true
    end
  end
end
