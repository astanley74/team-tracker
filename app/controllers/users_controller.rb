class UsersController < ApplicationController
    before_action :verified_user
    skip_before_action :verified_user, only: [:new, :create]

    def new
        if session[:user_id]
            @user = User.find(session[:user_id])
            redirect_to user_path(@user)
        else
            @user = User.new
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = @user.errors.full_messages
            redirect_to signup_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
        def user_params
            params.require(:user).permit(:email, :password, :name)
        end
end