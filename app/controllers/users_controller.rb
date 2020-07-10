class UsersController < ApplicationController
    
    def welcome
    end

    def new 
        @user = User.new
    end

    def create
        if params[:user][:password] == params[:user][:password_confirmation]
            @user = User.create(user_params)
            if @user 
                @user.save
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:alert] = "There was a problem with your signup. Please try again."
                redirect_to '/signup'
            end
        else
            redirect_to '/signup', notice: "Passwords do not match. Please try again."
        end
    end

    def signup
    end

    def signin
    end

    def login
        @user = User.find_by(:username => params[:username])
            if @user.authenticate(params[:password])   
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:alert] = "Username or Password incorrect. Please try again."
             redirect_to '/signin'
            end
    end

    def logout
        session.delete(:user_id)
        redirect_to '/'
    end


    def show
        if current_user
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