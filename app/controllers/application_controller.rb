class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    def logged_in?
        !!current_user
    end

    def current_image
        image = @post.find(params[:post][:image])    
        if image.save &
           @post.record.image.attach
           @post.record.image.save
           @post.record.image
        end
    end 
       
       def current_record
        record = @post.find(params[:post][:record])
        if record.save
           @post.record
        end 
    end
    
    def current_user
        @current_user = User.find(session[:user_id])
    end

end
