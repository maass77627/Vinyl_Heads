class SessionsController < ApplicationController
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
        session[:user_id] = @user.id
        @user.save
        redirect_to user_path(@user)
      else
       redirect_to login_path
      end
    end

    def facebook
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        # u.uid = auth['uid']
      u.username = auth['info']['name']
      u.password = 'Temporary'
      u.email = auth['info']['email']
    end
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end

    def destroy
      session[:user_id] = nil
      redirect_to '/'
    end

    private

    def auth
      request.env['omniauth.auth']
    end

    def sessions_params
      params.require(:user).permit(:email, :password, :username)
    end
  end



