class UsersController < ApplicationController
    
    def new 
        @user = User.new
    end

    def create 
        @user = User.new(params_hash)

        # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        # @user = User.new(params[:username], params[:email], params[:password])
        if @user.save 
            redirect_to new_user_path

        else 
            render :new, status: :unprocessable_entity
        end
    end 

    def edit 
        @user = User.find(params[:id])
    end 

    def update 
        @user = User.find(params[:id])
        if @user.update(params_hash)
            redirect_to new_user_path
        else 
            render :edit, status: :unprocessable_entity
        end
    end

    private 
    def params_hash
        params.require(:user).permit(:username, :email, :password)
    end
end
