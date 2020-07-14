class JournalsController < ApplicationController
    
    def new
        @journal = Journal.new(user_id: params[:user_id])
        @journal.plant = Plant.new
        @journal.water = Water.new
    end

    def create
        

        @journal = Journal.create(journal_params)
        @journal.plant.user_id = current_user.id
        @journal.water.user_id = current_user.id
        @journal.save

        if @journal.valid?
            redirect_to user_journal_path(@journal.user, @journal)
        else
            flash[:alert] = @journal.errors.full_messages
            redirect_to new_user_journal_path(current_user)
        end
    end

    def show
        if current_journal.user.id == session[:user_id]
            binding.pry
            @user = current_user
            @journal = current_journal
        else
            flash[:msg] = "Sorry, you must be the owner of this journal entry to view it!"
            redirect_to new_user_journal_path
        end
    end


    def index
        @journals = Journal.all 
    end

    def edit
        if current_journal.user.id = session[:user_id]
            @journal = current_journal
        else
            flash[:alert] = "Sorry, you must be the owner of this journal entry to edit it!"
            redirect_to journal_path(journal)
        end
    end

    def update
        current_journal.update(journal_params)
        redirect_to user_journal_path(current_journal.user.id, current_journal)
    end

    def destroy
        current_journal.destroy.save
        redirect_to user_path(current_user)
      end

    def water
        current_journal.update_water
        redirect_to user_path(current_user)
    end


    private

    def current_journal
        Journal.find_by(:id => params[:id])
    end

    def journal_params
        if params[:journal][:plant_id] != "" && params[:journal][:water_id] != ""
            params[:journal].delete :plant_attributes
            params[:journal].delete :water_attributes
            params.require(:journal).permit(:date, :last_watered, :user_id, :plant_id, :water_id)
        elsif params[:journal][:water_id] != ""
            params[:journal].delete :plant_id
            params[:journal].delete :water_attributes
            params.require(:journal).permit(:date, :last_watered, :user_id, :water_id, plant_attributes: [:plant, :user_id, :name, :characteristics, :light, :difficulty])    
        elsif params[:journal][:plant_id] != ""
            params[:journal].delete :water_id
            params[:journal].delete :plant_attributes
            params.require(:journal).permit(:date, :last_watered, :user_id, :plant_id, water_attributes: [:water, :user_id, :plant_family, :weeks, :soil])
        else
            params[:journal].delete :plant_id
            params[:journal].delete :water_id
            params.require(:journal).permit(:date, :last_watered, :user_id, plant_attributes: [:plant, :user_id, :name, :characteristics, :light, :difficulty], water_attributes: [:plant, :user_id, :plant_family, :weeks, :soil])
        end
      end
end
