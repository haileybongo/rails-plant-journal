class User < ApplicationRecord
    has_many :journals
    has_many :waters
    has_many :plants
    validates :username, presence: true, uniqueness: true
    has_secure_password


    def needs_water

        needs_water = []
        self.journals.each do |journal|
          if journal.water && journal.water.weeks && journal.last_watered
            days_since_watered = Date.today - journal.last_watered
            case journal.water.weeks 

            when 1
                if days_since_watered > 7 
                    needs_water << journal
                else
                end
            when 2
                if days_since_watered > 14 
                    needs_water << journal
                else
                end
            when 3
                if days_since_watered > 21 
                    needs_water << journal
                else
                end
            when 4
                if days_since_watered > 28 
                    needs_water << journal
                else
                end
            when 5
                if days_since_watered > 36 
                    needs_water << journal
                else
                end
            when 6
                if days_since_watered > 43 
                    needs_water << journal
                else
                end
            else
            end
        end
        end
        needs_water
    end
  
end




            
