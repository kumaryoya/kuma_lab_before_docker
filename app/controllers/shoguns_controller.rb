# frozen_string_literal: true

# Controller for managing actions related to shoguns.
class ShogunsController < ApplicationController
  require 'net/http'

  def new; end

  def result; end

  def scoring
    uri = URI.parse('https://kumalab.cognitiveservices.azure.com/face/v1.0/detect?returnFaceLandmarks=true')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme === 'https'
    body = params[:image].read
    headers = {
      'Content-Type' => 'application/octet-stream',
      'Ocp-Apim-Subscription-Key' => ENV.fetch('AZURE_FACE_API_KEY', nil)
    }
    response = http.post(uri, body, headers)
    result = JSON.parse(response.body)
    @faces = result
    # 顔の数を確認し、0または2つ以上の場合にエラーを発生させる
    if @faces.empty? || @faces.length >= 2
      flash[:alert] = '顔が正確に1つ検出されていないか、2つ以上の顔が検出されました。1つの顔の画像を使用してください。'
      redirect_to faces_path
    else
      puts @faces
    end
  end
end
