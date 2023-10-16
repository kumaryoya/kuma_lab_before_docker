# frozen_string_literal: true

require 'rails_helper'

describe 'zoos' do
  context 'when 正常' do
    before do
      visit '/'
      click_link 'ZooMania'
    end

    let!(:zoo1) { create(:zoo, area: '関東地方') }
    let!(:zoo2) { create(:zoo, area: '関東地方') }
    let!(:zoo3) { create(:zoo, area: '関西地方') }

    it 'with ZooManiaにアクセスすることができる' do
      expect(page).to have_content('動物園一覧')
      expect(page).to have_current_path top_zoos_path, ignore_query: true
    end

    it 'with 動物園一覧を見ることができる' do
      click_link '動物園一覧'
      expect(page).to have_content('zoo14.test_name')
      expect(page).to have_current_path zoos_path, ignore_query: true
    end

    it 'with 動物園を地方で検索することができる' do
      click_link '動物園一覧'
      select '関東地方', from: 'q_area_cont'
      click_button '検索'
      expect(page).to have_content 'zoo17.test_name'
      expect(page).not_to have_content 'zoo19.test_name'
      expect(page).to have_current_path zoos_path, ignore_query: true
    end

    it 'with 動物園を動物園で検索することができる' do
      click_link '動物園一覧'
      fill_in 'q_name_cont', with: '20'
      click_button '検索'
      expect(page).to have_content 'zoo20.test_name'
      expect(page).not_to have_content 'zoo21.test_name'
      expect(page).to have_current_path zoos_path, ignore_query: true
    end

    it 'with 動物園を地方と動物園で検索することができる' do
      click_link '動物園一覧'
      select '関東地方', from: 'q_area_cont'
      fill_in 'q_name_cont', with: '23'
      click_button '検索'
      expect(page).to have_content 'zoo23.test_name'
      expect(page).not_to have_content 'zoo24.test_name'
      expect(page).to have_current_path zoos_path, ignore_query: true
    end

    it 'with 動物園詳細を見ることができる' do
      click_link '動物園一覧'
      click_link 'zoo26.test_name'
      expect(page).to have_content('zoo26.test_location')
      expect(page).to have_current_path zoo_path(1), ignore_query: true
    end

    it 'with 動物園日本地図を見ることができる' do
      click_link '動物園日本地図'
      expect(page).to have_content('ピンを押すと動物園の名称が表示されるゾゥ')
      expect(page).to have_current_path map_zoos_path, ignore_query: true
    end

    it 'with おすすめの動物園を見ることができる' do
      click_link 'おすすめの動物園'
      expect(page).to have_content('現在地から近い動物園5つをおすすめするゾゥ')
      expect(page).to have_current_path recommend_zoos_path, ignore_query: true
    end
  end
end
