class UsersController < ApplicationController
    before_action :verified_user
    before_action :correct_user, only: [:show]
    skip_before_action :verified_user, only: [:new, :create]

    def new
        if session[:user_id]
            redirect_to user_path(current_user)
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
            redirect_to signup_path
        end
    end

    def show
    end

    private
        def user_params
            params.require(:user).permit(:email, :password, :name)
        end

        def correct_user
            @user = User.find(params[:id])
            redirect_to user_path(current_user) unless current_user.id == @user.id
        end

end