# frozen_string_literal: true

# Controller for managing actions related to shoguns.
class ShogunsController < ApplicationController
  require 'net/http'

  def new
    @shogun = Shogun.new
  end

  def show
    @shogun = Shogun.find(params[:id])
    @quote = ["目を見れば分かります。本気で夢を描いて、夢に恋焦がれているかどうかは。",
      "皆と共に修羅場をくぐりなさい。素質はありますよ。",
      "全軍前進。",
      "ンフフフフお見事です。",
      "これだから乱世は面白い。",
      "ここはまだ死地ではありません。",
      "これが将軍の見る景色です。",
      "我正に死線に在り。",
      "宴は城で始まったばかりでしょォォ。",
      "仲間というかァ、ンフフフ愛人です。"].sample
  end

  def scoring
    @shogun = Shogun.new
    @minus = 0
    uri = URI.parse('https://kumalab.cognitiveservices.azure.com/face/v1.0/detect?returnFaceLandmarks=true')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme === 'https'
    if params[:image].nil?
      flash[:alert] = '画像を選択してください'
      redirect_to new_shogun_path
      return
    end
    body = params[:image].read
    headers = { 'Content-Type' => 'application/octet-stream', 'Ocp-Apim-Subscription-Key' => ENV.fetch('AZURE_FACE_API_KEY', nil) }
    response = http.post(uri, body, headers)
    result = JSON.parse(response.body)
    @faces = result
    if @faces.empty?
      flash[:alert] = '顔が検出できませんでした'
      redirect_to new_shogun_path
      return
    elsif @faces.length >= 2
      flash[:alert] = '複数の顔が検出されました'
      redirect_to new_shogun_path
      return
    else
      @minus += ( @faces[0]["faceRectangle"]["top"].to_i - 138 ).abs
      @minus += ( @faces[0]["faceRectangle"]["left"].to_i - 143 ).abs
      @minus += ( @faces[0]["faceRectangle"]["width"].to_i - 186 ).abs
      @minus += ( @faces[0]["faceRectangle"]["height"].to_i - 186 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["pupilLeft"]["x"].to_i - 189 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["pupilLeft"]["y"].to_i - 184 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["pupilRight"]["x"].to_i - 283 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["pupilRight"]["y"].to_i - 189 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["noseTip"]["x"].to_i - 234 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["noseTip"]["y"].to_i - 250 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["mouthLeft"]["x"].to_i - 201 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["mouthLeft"]["y"].to_i - 268 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["mouthRight"]["x"].to_i - 271 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["mouthRight"]["y"].to_i - 271 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyebrowLeftOuter"]["x"].to_i - 155 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyebrowLeftOuter"]["y"].to_i - 161 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyebrowLeftInner"]["x"].to_i - 222 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyebrowLeftInner"]["y"].to_i - 175 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeLeftOuter"]["x"].to_i - 172 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeLeftOuter"]["y"].to_i - 184 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeLeftTop"]["x"].to_i - 190 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeLeftTop"]["y"].to_i - 181 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeLeftBottom"]["x"].to_i - 188 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeLeftBottom"]["y"].to_i - 192 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeLeftInner"]["x"].to_i - 205 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeLeftInner"]["y"].to_i - 190 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyebrowRightInner"]["x"].to_i - 260 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyebrowRightInner"]["y"].to_i - 176 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyebrowRightOuter"]["x"].to_i - 319 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyebrowRightOuter"]["y"].to_i - 162 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeRightInner"]["x"].to_i - 264 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeRightInner"]["y"].to_i - 193 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeRightTop"]["x"].to_i - 282 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeRightTop"]["y"].to_i - 184 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeRightBottom"]["x"].to_i - 284 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeRightBottom"]["y"].to_i - 196 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeRightOuter"]["x"].to_i - 300 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["eyeRightOuter"]["y"].to_i - 188 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["noseRootLeft"]["x"].to_i - 221 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["noseRootLeft"]["y"].to_i - 194 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["noseRootRight"]["x"].to_i - 249 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["noseRootRight"]["y"].to_i - 195 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["noseLeftAlarTop"]["x"].to_i - 215 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["noseLeftAlarTop"]["y"].to_i - 225 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["noseRightAlarTop"]["x"].to_i - 251 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["noseRightAlarTop"]["y"].to_i - 225 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["noseLeftAlarOutTip"]["x"].to_i - 207 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["noseLeftAlarOutTip"]["y"].to_i - 238 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["noseRightAlarOutTip"]["x"].to_i - 262 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["noseRightAlarOutTip"]["y"].to_i - 238 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["upperLipTop"]["x"].to_i - 234 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["upperLipTop"]["y"].to_i - 273 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["upperLipBottom"]["x"].to_i - 234 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["upperLipBottom"]["y"].to_i - 279 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["underLipTop"]["x"].to_i - 236 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["underLipTop"]["y"].to_i - 281 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["underLipBottom"]["x"].to_i - 237 ).abs
      @minus += ( @faces[0]["faceLandmarks"]["underLipBottom"]["y"].to_i - 292 ).abs
      @minus /= 1000
      @shogun.score = 100 - @minus
      @shogun.score = 0 if @shogun.score < 0
      @shogun.save
      redirect_to shogun_path(@shogun)
    end
  end
end
  # 将軍のスコア
  # “faceRectangle"=>{"top"=>138, "left"=>143, "width"=>186, "height"=>186},
  # "faceLandmarks"=>{
  # "pupilLeft"=>{"x"=>189.5, "y"=>184.6},
  # "pupilRight"=>{"x"=>283.4, "y"=>189.4},
  # "noseTip"=>{"x"=>234.6, "y"=>250.0},
  # "mouthLeft"=>{"x"=>201.9, "y"=>268.0},
  # "mouthRight"=>{"x"=>271.5, "y"=>271.1},
  # "eyebrowLeftOuter"=>{"x"=>155.0, "y"=>161.3},
  # "eyebrowLeftInner"=>{"x"=>222.2, "y"=>175.9},
  # "eyeLeftOuter"=>{"x"=>172.5, "y"=>184.3},
  # "eyeLeftTop"=>{"x"=>190.2, "y"=>181.5},
  # "eyeLeftBottom"=>{"x"=>188.6, "y"=>192.8},
  # "eyeLeftInner"=>{"x"=>205.6, "y"=>190.1},
  # "eyebrowRightInner"=>{"x"=>260.0, "y"=>176.4},
  # "eyebrowRightOuter"=>{"x"=>319.2, "y"=>162.1},
  # "eyeRightInner"=>{"x"=>264.5, "y"=>193.2},
  # "eyeRightTop"=>{"x"=>282.0, "y"=>184.4},
  # "eyeRightBottom"=>{"x"=>284.5, "y"=>196.6},
  # "eyeRightOuter"=>{"x"=>300.8, "y"=>188.2},
  # "noseRootLeft"=>{"x"=>221.8, "y"=>194.2},
  # "noseRootRight"=>{"x"=>249.5, "y"=>195.5},
  # "noseLeftAlarTop"=>{"x"=>215.9, "y"=>225.1},
  # "noseRightAlarTop"=>{"x"=>251.0, "y"=>225.0},
  # "noseLeftAlarOutTip"=>{"x"=>207.9, "y"=>238.7},
  # "noseRightAlarOutTip"=>{"x"=>262.2, "y"=>238.2},
  # "upperLipTop"=>{"x"=>234.1, "y"=>273.3},
  # "upperLipBottom"=>{"x"=>234.1, "y"=>279.4},
  # "underLipTop"=>{"x"=>236.6, "y"=>281.8},
  # "underLipBottom"=>{"x"=>237.5, "y"=>292.7}}
