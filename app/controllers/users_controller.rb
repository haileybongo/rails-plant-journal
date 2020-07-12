class UsersController < ApplicationController
    
    def welcome
    end

    def new 
        @user = User.new
    end

    def create
        if params[:user][:password] == params[:user][:password_confirmation]
            @user = User.create(user_params)
            if @user.valid? 
                @user.save
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:alert] = @user.errors.full_messages
                redirect_to '/signup'
            end
        else
            redirect_to '/signup', notice: "Passwords do not match. Please try again."
        end
    end



    def show
        if current_user
        @needs_water = current_user.needs_water
        @user = current_user
        else
            redirect_to '/'
        end
    end

   
    private
   
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

end