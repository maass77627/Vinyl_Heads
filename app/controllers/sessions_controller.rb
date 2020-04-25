class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    def new
       
        end 


def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
<<<<<<< HEAD
        @user.save
        session[:user_id] = @user.id
        redirect_to home_path#, notice: "Logged in!"
    else
       # flash.now[:alert] = "Email or password is invalid"
        render :new
=======
        session[:current_user_id] = @user.id
        redirect_to '/home'
    else
        redirect_to '/login'
        #render :new
>>>>>>> 792ee71d4d5f803d990291607a895611529ecb45
    end
end

def destroy
<<<<<<< HEAD
    session[:user_id] = nil
    redirect_to '/', notice: "Logged out!"
=======
    reset_session
    redirect_to "/"

>>>>>>> 792ee71d4d5f803d990291607a895611529ecb45
end

    def page_requires_login

    end
end



