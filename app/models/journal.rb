class Journal < ApplicationRecord
    belongs_to :user
    belongs_to :plant, optional: true
    belongs_to :water, optional: true 
    accepts_nested_attributes_for :plant, :water

    def update_water
        self.last_watered = Date.today
        self.save
    end


end
