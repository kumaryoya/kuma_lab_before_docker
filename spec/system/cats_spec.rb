# frozen_string_literal: true

require 'rails_helper'

describe 'cats' do
  context 'when 正常' do
    it 'with index' do
      visit '/'
      click_link 'にゃんにゃんルーレット'
      expect(page).to have_content('にゃんにゃんルーレット')
    end
  end
end
