class SessionsController < ApplicationController

    def new
        if current_user
            redirect_to '/'
          else
            @user = User.new
          end

    end

def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path
    else
        render :new
    end
end

def destroy

end
end
