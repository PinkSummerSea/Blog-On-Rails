class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new params.require(:user).permit!
        if @user.save
            session[:user_id] = @user.id 
            redirect_to root_path, notice: "Successfully signed up"
        else  
            render :new, status: 303
        end
    end

    def edit
        @user = User.find params[:id]
    end

    def update
        @user = User.find params[:id]
        @user.update params.require(:user).permit!
        if @user.save
            redirect_to root_path, notice: "Successfully updated your account"
        else 
            render :edit, status: 303
        end
    end

    def change_password
        @user = User.find params[:id]
    end

    def patch_changed_password
        
        @user = User.find params[:id]

        #if params.require(:user).permit(:current_password) != params.require(:user).permit(:password)
            @user.update(params.require(:user).permit(:password, :password_confirmation))
            if @user.save
                redirect_to root_path, notice: "Password updated" and return 
            else  
                render :change_password
            end

    end
end
