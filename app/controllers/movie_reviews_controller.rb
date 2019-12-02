class MovieReviewsController < ApplicationController
    before_action :find_movie_review, only: [:edit, :update, :destroy]

    def index
        @moviereviews = MovieReview.all
    end

    def new
        @moviereview = MovieReview.new
    end

    def create
        @movierevew = MovieReview.new(movie_review_params)
        if @moviereview.valid?
            @moviereview.save
            redirect_to @moviereview
          else
            flash[:errors] = @moviereview.errors.full_messages
            redirect_to new_movie_review_path
          end
    end

    def edit
        
    end

    def update
        if @moviereview.valid?
            @moviereview.save
            redirect_to @moviereview
          else
            render :edit
            redirect_to edit_movie_review_path
          end
    end

    def destroy
        @moviereview.destroy
        redirect_to movie_reviews_path
    end

    private

    def find_movie_review
        @moviereview = MovieReview.find_by(params[:id])
    end

    def movie_review_params
        params.require(:movie_review).permit(:content, :rating)
    end

end
