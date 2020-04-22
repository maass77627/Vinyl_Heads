class ApplicationController < ActionController::Base
    #include ApplicationHelper:: SessionsHelper
    before_action :current_user



    def home 
    end 
    
   private

   helper_method :login(user), :current_user

   def login(user)
    session[:current_user_id]
    @current_user = User.find(session[:current_user_id])
   end 

   def current_user
        if session[:current_user_id]
            @current_user = User.find(session[:current_user_id])
        end
    end
end
