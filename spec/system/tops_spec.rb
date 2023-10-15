# frozen_string_literal: true

require 'rails_helper'

describe 'tops' do
  context 'when 正常' do
    it 'with トップページにアクセスすることができる' do
      visit '/'
      expect(page).to have_content('くまらぼへようこそ')
    end

    it 'with プライバシーポリシーにアクセスすることができる' do
      visit '/'
      click_link 'プライバシーポリシー'
      expect(page).to have_content('プライバシーポリシー')
    end

    it 'with 利用規約にアクセスすることができる' do
      visit '/'
      click_link '利用規約'
      expect(page).to have_content('利用規約')
    end

    it 'with お問い合わせフォームにアクセスすることができる' do
      visit '/'
      new_window = window_opened_by { click_link 'お問い合わせ' }
      within_window new_window do
        expect(page).to have_content '「くまらぼ」のお問い合わせフォーム'
      end
    end
  end
end
