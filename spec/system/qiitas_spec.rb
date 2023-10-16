# frozen_string_literal: true

require 'rails_helper'

describe 'qiitas' do
  context 'when 正常' do
    it 'with Railsちゃんねるにアクセスすることができる' do
      visit '/'
      click_link 'Railsちゃんねる'
      expect(page).to have_content('一昨日から今日にかけて投稿された「Rails」タグが付いたQiita記事一覧')
      expect(page).to have_current_path qiitas_path, ignore_query: true
    end
  end
end
