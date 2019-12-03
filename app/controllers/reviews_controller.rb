class ReviewsController < ApplicationController
    before_action :find_review, only: [:edit, :update, :destroy]

    def index
        @movie = Movie.find(params[:id])
        @current_user = User.find_by(name: session[:name])
        @reviews = Review.all
    end

    def new
        @movie = Movie.find(params[:id])
        @current_user = User.find_by(name: session[:name])
        @review = Review.new
    end

    def create
        @movie = Movie.find(params[:id])
        @current_user = User.find_by(name: session[:name])
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
        @movie = Movie.find(params[:id])
        @current_user = User.find_by(name: session[:name])
    end

    def edit
        
    end

    def update
        @movie = Movie.find(params[:id])
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
        @review = Review.find_by(params[:id])
    end

    def review_params
        params.require(:review).permit(:content, :rating)
    end

end
