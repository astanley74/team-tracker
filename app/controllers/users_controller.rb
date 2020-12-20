class UsersController < ApplicationController

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

        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user)
        else
            render 'users/new'
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