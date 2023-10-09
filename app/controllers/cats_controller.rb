# frozen_string_literal: true

# Controller for managing cat-related actions.
class CatsController < ApplicationController
  require 'net/http'

  def index
    uri = URI.parse('https://api.thecatapi.com/v1/images/search')
    response = Net::HTTP.get_response(uri)
    json_data = JSON.parse(response.body)
    @cat_image_url = json_data[0]['url']
  end
end
