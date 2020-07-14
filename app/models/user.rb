class User < ApplicationRecord
    has_many :journals
    has_many :waters
    has_many :plants
    validates :username, presence: true, uniqueness: true
    has_secure_password


    def needs_water

        needs_water = []
        self.journals.each do |journal|
          if journal.water.weeks && journal.last_watered
            days_since_watered = Date.today - journal.last_watered
            if journal.water.weeks * 7 < days_since_watered
                needs_water << journal
            else
            end
            end
        end
        needs_water
    end
  
end




            
