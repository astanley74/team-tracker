class UsersController < ApplicationController
    before_action :verified_user
    skip_before_action :verified_user, only: [:new, :create]

    def new
        if session[:user_id]
            redirect_to user_path(current_user)
        else
            @user = User.new
        end
    end

    def create
        if @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        redirect_to user_path(current_user) unless current_user.id == @user.id
    end

    private
        def user_params
            params.require(:user).permit(:email, :password, :name)
        end
end