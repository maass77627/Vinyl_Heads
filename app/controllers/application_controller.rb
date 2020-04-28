class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
   # before_action :require_log_in
    def home
    end 
    
    def logged_in?
        !!current_user
    end
    
    def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    private
    #def require_log_in
      #  redirect_to '/' unless logged_in? ######3
     # end
end
