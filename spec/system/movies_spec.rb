# frozen_string_literal: true

require 'rails_helper'

describe 'movies' do
  let!(:movie) do
    create(:movie, title: 'グレイテスト・ショーマン',
                  poster_path: '/jVGK50VhFOXgXkmcOFLrsPrtqJq.jpg',
                  release_date: '2017-12-20',
                  overview: '19世紀、ニューヨーク。貧しい生まれのバーナムは上流家庭の令嬢チャリティを妻に迎えたが失業し、大衆向けの博物館を開業。
                            しかし客は集まらず、バーナムはユニークな人々を博物館に集め、歌あり踊りありで空中ぶらんこや動物の曲芸も見せるショーを売りにするとたちまち大成功。
                            さらにバーナムは社会に認められたいという野心のため、ヨーロッパの女性歌手リンドを米国に招くが、家族やショーの出演者たちと心がすれ違いだす。')
  end

  context 'when 正常' do
    before do
      visit '/'
      click_link 'FilmBaton'
    end

    it 'with FilmBatonにアクセスすることができる' do
      expect(page).to have_content('グレイテスト・ショーマン')
      expect(page).to have_current_path movies_path, ignore_query: true
    end

    it 'with 映画を検索することができる' do
      click_link '次の訪問者へ映画をおすすめする'
      fill_in 'looking_for', with: 'アイアンマン'
      click_button '検索'
      sleep(1)
      expect(page).to have_content 'アイアンマン'
      expect(page).to have_current_path new_movie_path, ignore_query: true
    end

    it 'with 映画をおすすめすることができる' do
      click_link '次の訪問者へ映画をおすすめする'
      fill_in 'looking_for', with: 'アイアンマン'
      click_button '検索'
      sleep(1)
      first(:button, 'おすすめする').click
      expect(page).to have_content 'アイアンマン'
      expect(page).to have_current_path movies_path, ignore_query: true
    end
  end

  context 'when 異常' do
    it 'with タイトルを入力しないと映画を検索することができない' do
      visit '/'
      click_link 'FilmBaton'
      click_link '次の訪問者へ映画をおすすめする'
      fill_in 'looking_for', with: ''
      click_button '検索'
      sleep(1)
      expect(page).to have_content 'NoResult'
      expect(page).to have_current_path new_movie_path, ignore_query: true
    end
  end
end
