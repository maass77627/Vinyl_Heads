class UsersController < ApplicationController

    def index
       # @users = User.all
    end
    
    def new
        if session[:current_user_id]
            redirect_to "/"
    end
end 

    def create
       # @user = User.create(user_params)
        #@user = current_user
        #if @user.save
           # session[:user_id] = @user.id
           # redirect_to user_path(@user)
        #else
          #  render :new
          @user = User.new
          @user.email = params[:email]
          @user.save
          redirect_to "/login"
       # end
    end



    def show
       # @user =User.find(params[:id])

    end

    #private

    #def user_params
       # params.require(:user).permit(:username, :email, :password)
   # end
end
