class Water < ApplicationRecord
    belongs_to :user
    has_many :journals
    has_many :plants, through: :journals
end
