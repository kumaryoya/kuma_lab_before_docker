# frozen_string_literal: true

# Controller for managing Qiita-related actions.
class QiitasController < ApplicationController
  require 'net/http'
  before_action :set_query

  def index
    url = URI.parse("https://qiita.com/api/v2/items?query=#{URI.encode_www_form_component(@query)}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request['Authorization'] = "Bearer #{ENV['QIITA_ACCESS_TOKEN']}"
    response = http.request(request)
    @articles = JSON.parse(response.body)
  end

  private

  def set_query
    @query = "created:>=#{(Time.zone.today - 2).strftime('%Y-%m-%d')} tag:Rails"
  end
end
