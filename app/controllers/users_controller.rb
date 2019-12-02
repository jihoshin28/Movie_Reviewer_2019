class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to @user
          else
            flash[:errors] = @user.errors.full_messages
            render :new
          end
    end

    def show

    end

    def edit
        
    end

    def update
        if @user.valid?
            @user.save
            redirect_to @user
          else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_dog_path
          end
    end

    def destroy
        @user.destroy
        redirect_to "/"
    end

    private

    def find_user
        @user = User.find_by(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :password, :age, :country, :bio)
    end

end
