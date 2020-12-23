class ApplicationController < ActionController::Base
    helper_method :current_user

    def home
    end

    private

        def verified_user
            redirect_to root_path unless authenticate_user
        end

        def authenticate_user
            !!current_user
        end

        def current_user
            @current_user ||= User.find_by_id(session[:user_id])
        end

end
