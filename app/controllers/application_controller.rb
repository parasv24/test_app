class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :require_user, :require_same_user
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
    def require_user
        if !logged_in?
            redirect_to login_path
        end
    end
    def require_same_user_article
        if current_user != @article.user
            redirect_to articles_path
        end
    end
    def require_same_user
        if current_user != @user
            redirect_to users_path
        end
    end
    def index
    end
    def about
    end
end
