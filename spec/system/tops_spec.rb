# frozen_string_literal: true

require 'rails_helper'

describe 'tops' do
  context 'when 正常' do
    it 'with index' do
      visit '/'
      expect(page).to have_content('くまらぼへようこそ')
    end

    it 'with privacy_policy' do
      visit '/'
      click_link 'プライバシーポリシー'
      expect(page).to have_content('プライバシーポリシー')
    end

    it 'with terms_of_service' do
      visit '/'
      click_link '利用規約'
      expect(page).to have_content('利用規約')
    end

    it 'with inquiry' do
      visit '/'
      new_window = window_opened_by { click_link 'お問い合わせ' }
      within_window new_window do
        expect(page).to have_content '「くまらぼ」のお問い合わせフォーム'
      end
    end
  end
end
