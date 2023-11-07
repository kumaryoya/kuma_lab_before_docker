# frozen_string_literal: true

require 'rails_helper'

describe 'cats' do
  context 'when 正常' do
    it 'with にゃんにゃんルーレットにアクセスすることができる' do
      visit '/'
      click_link 'にゃんにゃんルーレット'
      sleep(1)
      expect(page).to have_content('にゃんにゃんルーレット')
      expect(page).to have_current_path cats_path, ignore_query: true
    end
  end
end
