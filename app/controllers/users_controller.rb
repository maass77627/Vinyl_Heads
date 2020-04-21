class UsersController < ApplicationController

    def index
        @users = User.all

    end
    
    def new
        @user = User.new

    end

    

    def create
        @user = User.create(user_params)
        @user = current_user
        if @user.save
            #binding.pry
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end



    def show
        @user =User.find(params[:id])

    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
