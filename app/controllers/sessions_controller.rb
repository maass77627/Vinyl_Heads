class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    def new
       
        end 


def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
        @user.save
        session[:user_id] = @user.id
        redirect_to home_path#, notice: "Logged in!"
    else
       # flash.now[:alert] = "Email or password is invalid"
        render :new
    end
end

def destroy
    session[:user_id] = nil
    redirect_to '/', notice: "Logged out!"
end

    def page_requires_login

    end
end



