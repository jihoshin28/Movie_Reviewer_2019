class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :authorized

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
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
            redirect_to edit_user_path
          end
    end

    def destroy
        @user.destroy
        redirect_to "/"
    end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :age, :email, :country, :bio)
    end

end
