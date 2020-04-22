class ApplicationController < ActionController::Base
    helper_method :logged_in? #:current_user
    before_action :current_user



    def home 
    end 
    
    def logged_in?
        !!current_user
    end

    
    def current_user
        if session[:current_user_id]
            @current_user = User.find(session[:current_user_id])
       #    @current_user = User.find(session[:user_id])
        end
    end
end
