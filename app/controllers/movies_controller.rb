class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(
      :title,
      :year,
      :director_id,
      images: []
      )
  end
end
