class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :logged_in?
    helper_method :current_user
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
def authorized
    redirect_to '/' unless logged_in?
 end
end
