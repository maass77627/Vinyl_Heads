class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
   
    def index
        @users = User.all

    end
    
    def new
        @user = User.new
    end

    

    def create
        @user = User.create(user_params)
        #@user = current_user
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/'
        else
            render :new
        end
    end

    def show
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
