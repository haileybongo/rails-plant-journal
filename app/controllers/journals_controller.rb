class JournalsController < ApplicationController
    
    def new
        @journal = Journal.new(user_id: params[:user_id])
        @journal.plant = Plant.new
        @journal.water = Water.new
    end

    def create
        binding.pry
        @journal = Journal.create(journal_params)
        
        if @journal.save
            @journal.save
            redirect_to journal_path(journal)
        else
            redirect_to journals_path
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
        redirect_to journal_path(current_journal)
    end

    private

    def current_journal
        Journal.find_by(id => params[:id])
    end

    def journal_params
        params.require(:journal).permit(:date, :last_watered, :user_id, plant_attributes: [:name, :characteristics, :light, :difficulty], water_attributes: [:plant_family, :weeks, :soil])
    end
end
