class SessionsController < ApplicationController
   # skip_before_action :authorized, only: [:new, :create]
    def new
        if current_user
            redirect_to '/'
          else
            @user = User.new
          end
        end 

def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
        @user.save
        session[:user_id] = @user.id
        redirect_to '/'
    else
       redirect_to sign_up_path
    end
end

def destroy
    session[:user_id] = nil
    redirect_to '/'
end

private

def sessions_params
    params.require(:user).permit(:email, :password, :username)
end 
   # def page_requires_login

   # end
end



