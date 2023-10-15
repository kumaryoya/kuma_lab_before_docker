# frozen_string_literal: true

require 'rails_helper'

describe 'tops' do
  context 'when 正常' do
    before do
      visit '/'
    end

    it 'with トップページにアクセスすることができる' do
      expect(page).to have_content('くまらぼへようこそ')
    end

    it 'with プライバシーポリシーにアクセスすることができる' do
      click_link 'プライバシーポリシー'
      expect(page).to have_content('プライバシーポリシー')
    end

    it 'with 利用規約にアクセスすることができる' do
      click_link '利用規約'
      expect(page).to have_content('利用規約')
    end

    it 'with お問い合わせフォームにアクセスすることができる' do
      new_window = window_opened_by { click_link 'お問い合わせ' }
      sleep(5)
      within_window new_window do
        expect(page).to have_content '「くまらぼ」のお問い合わせフォーム'
      end
    end
  end
end
