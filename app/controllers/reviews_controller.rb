class ReviewsController < ApplicationController
    before_action :find_review, only: [:show, :edit, :update, :destroy]
    
    def index
        @reviews = Review.all
    end

    def new
        @user = User.find(session[:user_id])
        @movie = Movie.find(session[:movie_id]) 
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        if @review.valid?
            @review.save
            redirect_to @review
          else
            flash[:errors] = @review.errors.full_messages
            redirect_to new_review_path
          end
    end

    def show 
        @user = @review.user
        @movie = @review.movie
    end

    def edit
        
    end

    def update
        @current_user = User.find_by(name: session[:name])
        if @review.valid?
            @review.save
            redirect_to @review
          else
            render :edit
            redirect_to edit_review_path
          end
    end

    def destroy
        @review.destroy
        redirect_to reviews_path
    end

    private

    def find_review
        @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:content, :rating, :movie_id, :user_id, :title)
    end

end
