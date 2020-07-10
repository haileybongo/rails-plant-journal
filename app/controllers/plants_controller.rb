class PlantsController < ApplicationController
    
    def new
        @plant = Plant.new
        @water = Water.new
    end

    def create

        @plant = Plant.create(plant_params)
        if @plant.save
            @plant.user_id = current_user.id
            @plant.save
            redirect_to plant_path(@plant)
        else
            redirect_to plants_path
        end
    end

    def index
        @plants = Plant.all 
    end

    def show
        @plant = current_plant
    end

    def edit
        if current_plant.user.id = session[:user_id]
            @plant = current_plant
        else
            flash[:alert] = "Sorry, you must be the owner of this plant to edit it!"
            redirect_to plant_path(plant)
        end
    end

    def update
        current_plant.update(plant_params)
        redirect_to plant_path(current_plant)
    end

    private

    def current_plant
        Plant.find_by(:id => params[:id])
    end

    def plant_params
        params.require(:plant).permit(:name, :characteristics, :light, :difficulty, waters_attributes: [:user_id, :plant_family, :weeks, :soil])
    end
end
