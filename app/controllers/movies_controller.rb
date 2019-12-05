class MoviesController < ApplicationController
    
    def index 
        @movies = Movie.all
    end

    def show
        @movie = Movie.find(params[:id])
        session[:movie_id] = @movie.id
    end
end
