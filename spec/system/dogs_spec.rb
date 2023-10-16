# frozen_string_literal: true

require 'rails_helper'

describe 'dogs' do
  context 'when 正常' do
    it 'with わんわんルーレットにアクセスすることができる' do
      visit '/'
      click_link 'わんわんルーレット'
      expect(page).to have_content('わんわんルーレット')
      expect(page).to have_current_path dogs_path, ignore_query: true
    end
  end
end
