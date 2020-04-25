class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
   
    def index
       # @users = User.all
    end
    
    def new
<<<<<<< HEAD
        @user = User.new
=======
        if session[:current_user_id]
            redirect_to "/"
>>>>>>> 792ee71d4d5f803d990291607a895611529ecb45
    end
end 

    def create
<<<<<<< HEAD
        @user = User.create(user_params)
        #@user = current_user
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/'
        else
            render :new
        end
=======
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
>>>>>>> 792ee71d4d5f803d990291607a895611529ecb45
    end

    def show
<<<<<<< HEAD
        @user =User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
       redirect_to new_user_path
    end 

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    end
=======
       # @user =User.find(params[:id])

    end

    #private

    #def user_params
       # params.require(:user).permit(:username, :email, :password)
   # end
end
>>>>>>> 792ee71d4d5f803d990291607a895611529ecb45
