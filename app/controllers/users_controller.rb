class UsersController < ApplicationController

    def show
    end

    def new
        @user = User.new
    end

    def create
        #create user
        #if user is saved
            # redirect to user show page
        #else
            # give error messages and redirect to signup page
        #end 
    end

    private
        def user_params
            params.require(:user).permit(:email, :password, :name)
        end
end