class UsersController < ApplicationController

    def show
    end

    def new
        @user = User.new
    end

    def create
    end

    private
        def user_params
            params.require(:user).permit(:email, :password, :name)
        end
end