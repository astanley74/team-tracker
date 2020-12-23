class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

    def omniauth
        @user = User.find_or_create_from_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end

    private
        def auth
            request.env['omniauth.auth']
        end
end