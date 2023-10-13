# frozen_string_literal: true

# Controller for managing movie-related actions.
class MoviesController < ApplicationController
  def index
    @last_movie = Movie.last
  end

  def new
    @recommend_movie = Movie.new
    movie_title = params[:looking_for]
    url = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV.fetch('TMDB_API')}&language=ja&query=" +
          URI.encode_www_form_component(movie_title)
    @result = JSON.parse(Net::HTTP.get(URI.parse(url)))
    @movies = @result['results'].first(12)
  end

  def create
    @recommend_movie = Movie.new(movie_params)
    if @recommend_movie.save
      flash[:alert] = '映画をおすすめしました'
      redirect_to movies_path
    else
      flash[:alert] = '映画をおすすめできませんでした'
      redirect_to new_movie_path, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_date, :overview, :poster_path)
  end
end
