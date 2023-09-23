class DogsController < ApplicationController
  require "net/http"

  def index
    uri = URI.parse("https://dog.ceo/api/breeds/image/random")
    response = Net::HTTP.get_response(uri)
    json_data = JSON.parse(response.body)
    @dog_image_url = json_data["message"]
  end
end
