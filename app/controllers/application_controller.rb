class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    
    def home
    end 
    
    def logged_in?
        !!current_user
    end
    
    def current_user
       # @current_user = User.find(session[:user_id])
        @current_user ||= User.find_or_create_by(id: session[:user_id]) if session[:user_id]
    end
end
