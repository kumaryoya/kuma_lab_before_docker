# frozen_string_literal: true

require 'rails_helper'

describe 'dogs' do
  context 'when 正常' do
    it 'with わんわんルーレットにアクセスすることができる' do
      visit '/'
      click_link 'わんわんルーレット'
      expect(page).to have_content('わんわんルーレット')
    end
  end
end
