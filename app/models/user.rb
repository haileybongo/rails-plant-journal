class User < ApplicationRecord
    has_many :journals
    has_many :waters
    has_many :plants
    has_secure_password

    def needs_water
        my_plants = 
        needs_water = []
        self.journals.each do |journal|
            days_since_watered = Date.today - journal.last_watered
            if journal.water.weeks = 1
                if days_since_watered > 7 
                    needs_water < journal.plant
                else
                end
            end
        end
    end
end


            
