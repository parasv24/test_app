class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    def current_user
        if session[:user_id]
          @current_user ||= User.find(session[:user_id])
        else
          false
        end
    end
    def logged_in?
        !!current_user
    end
    def index
    end
    def about
    end
end
