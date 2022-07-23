class ApplicationController < ActionController::Base
    private # helper_method under private is still availalbe in views?

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
    helper_method :current_user

    def authenticate_user!
        redirect_to new_session_path, flash[:alert]= "Please Sign In" unless current_user # need to check if it works
    end

end
