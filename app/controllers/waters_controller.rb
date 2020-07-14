class WatersController < ApplicationController
    
    def new
        @water = Water.new
    end

    def create
        @water = Water.create(water_params)
        if @water.save
            @water.user_id = current_user.id
            @water.save
            redirect_to water_path(@water)
        else
            flash[:alert] = @water.errors.full_messages
            redirect_to new_water_path
        end
    end

    def index
        @waters = Water.all 
    end

    def show
        @user = current_user
        @water = current_water
    end

    def edit
        if current_water.user.id = session[:user_id]
            @water = current_water
        else
            flash[:alert] = "Sorry, you must be the owner of this water entry to edit it!"
            redirect_to water_path(water)
        end
    end

    def update
        current_water.update(water_params)
        redirect_to water_path(current_water)
    end

    def destroy
        current_water.destroy.save
        redirect_to user_path(current_user)
      end


    private

    def current_water
        Water.find_by(:id => params[:id])
    end

    def water_params
        params.require(:water).permit(:weeks, :plant_family, :soil)
    end
end
