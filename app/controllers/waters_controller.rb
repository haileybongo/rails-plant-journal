class WatersController < ApplicationController
    
    def new
        @water = Water.new
    end

    def create
        water = Water.create(water_params)
        if water.save
            water.save
            redirect_to water_path(water)
        else
            redirect_to waters_path
        end
    end

    def index
        @waters = Water.all 
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

    private

    def current_water
        Water.find_by(id => params[:id])
    end

    def water_params
        params.require(:water).permit(:weeks, :plant_family, :soil)
    end
end
