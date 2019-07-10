class UsersController < ApplicationController
    before_action :load_user, only: [:show, :edit, :update, :destroy]
    
    def index
        @users = User.all.order(:last_name)
    end

    def new
        @user = User.new
    end

    def create 
        @user = User.new user_attribute
        if @user.save
            redirect_to @user
        else 
            render :new
        end
    end

    def update
        if @user.update user_attribute
            redirect_to @user
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
    
        redirect_to :users
    end

    def user_attribute
        params[:user].permit(:first_name, :last_name, :email)
    end

    def load_user
        @user = User.find(params[:id])
    end
end
