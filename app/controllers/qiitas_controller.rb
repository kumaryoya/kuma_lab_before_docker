class QiitasController < ApplicationController
  require 'net/http'

  def index
    yesterday = (Date.today - 2).strftime("%Y-%m-%d")
    query = "created:>=#{yesterday} tag:Rails"
    url = URI.parse("https://qiita.com/api/v2/items?query=#{URI.encode_www_form_component(query)}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request['Authorization'] = "Bearer #{ENV['QIITA_ACCESS_TOKEN']}"
    response = http.request(request)
    @articles = JSON.parse(response.body)
  end
end
