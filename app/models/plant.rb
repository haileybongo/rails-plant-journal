class Plant < ApplicationRecord
    belongs_to :user
    has_many :journals
    has_many :waters, through: :journals
    
end
