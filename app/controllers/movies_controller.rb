# frozen_string_literal: true

# Controller for managing movie-related actions.
class MoviesController < ApplicationController
  def index
    movie_title = params[:looking_for]
    url = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV.fetch('TMDB_API')}&language=ja&query=" +
          URI.encode_www_form_component(movie_title)
    @a = JSON.parse(Net::HTTP.get(URI.parse(url)))
    @movies = @a['results']
  end

  def show
    movie_id = params[:id]
    url = "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV.fetch('TMDB_API')}&language=ja"
    @movie = JSON.parse(Net::HTTP.get(URI.parse(url)))
  end
end
