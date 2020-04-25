class SessionsController < ApplicationController

    def new
       
        end 


def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path, notice: "Logged in!"
    else
        flash.now[:alert] = "Email or password is invalid"
        render :new
    end
end

def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
end
end



