class UsersController < ApplicationController
    before_action :get_user, only: [:edit, :delete, :update, :show]
    before_action :require_user , except: [:show, :index]
    before_action :require_same_user , only: [:edit, :delete, :update]
    def new
        @user = User.new
    end
    def create
        @user = User.new(params.require(:user).permit(:username, :email, :password))
        respond_to do |format|
            if @user.save
                session[:user_id] = @user.id
                format.html { redirect_to root_path, notice: "Article was successfully created." }
            else
                redirect_to new
            end
        end 
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        respond_to do |format|
            @user.update(params.require(:user).permit(:username, :email, :password))
            format.html { redirect_to users_path, notice: "Article was successfully updated." }
        end
    end
    def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end
    def index
        @users = User.all
    end
    def destroy
        @user = User.find(params[:id])
        respond_to do |format|
            @user.destroy
            format.html { redirect_to users_url, notice: "Article was successfully updated." }
        end
    end
    def get_user
        @user = User.find(params[:id])
    end
end
