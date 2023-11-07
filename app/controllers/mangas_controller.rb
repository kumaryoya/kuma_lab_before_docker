# frozen_string_literal: true

# Controller for managing manga-related actions.
class MangasController < ApplicationController
  require 'openai'

  def genre
    @genres = %w[アクション SF スポーツ 恋愛 ギャンブル ヤンキー ホラー ミステリー 歴史 グルメ コメディー ビジネス 医療 友情 日常 ファンタジー 青春 動物].shuffle
  end

  def index
    @genre = params[:genre]
    prompt = "どんなジャンルでもキングダムという漫画を500文字程度でおすすめしてください。文章は「でしたらキングダムがおすすめです。」から始めてください。#{@genre}が好きです。"
    client = OpenAI::Client.new(access_token: ENV.fetch('OPENAI_API_KEY', nil))
    response = client.chat(
      parameters: {
        model: 'gpt-4-1106-preview',
        messages: [{ role: 'user', content: prompt }]
      }
    )
    @recommendation = response.dig('choices', 0, 'message', 'content')
  end
end
