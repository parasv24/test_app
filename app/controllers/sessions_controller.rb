class SessionsController < ApplicationController
    def new
    end
    def create
        @user = User.find_by(email:params[:session][:email])
        respond_to do |format|
            if User.find_by(email:params[:session][:email].downcase)
                if @user.authenticate(params[:session][:password])
                        session[:user_id] = @user.id
                        format.html { redirect_to user_path(@user), notice: "Article was successfully created." }
                else
                    format.html { redirect_to login_path, notice: "Article was successfully created." }
                end
            else
                format.html { redirect_to login_path, notice: "Article was successfully created." }
            end
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
end
