class SessionsController < ApplicationController
    
    def create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.username = auth['info']['name']
          u.password = SecureRandom.hex(8)
        end
     
        session[:user_id] = @user.id
     
        redirect_to user_path(@user)
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

    private
     
    def auth
      request.env['omniauth.auth']
    end

end
