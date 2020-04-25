class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    
    def home
    end 
    
    def logged_in?
        !!current_user
    end
    
    def current_user
        if session[:user_id]
        @current_user ||= User.find_or_create_by(id: session[:user_id]) 
    else 
        @current_user = nil
    end
end
end
