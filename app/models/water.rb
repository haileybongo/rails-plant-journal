class Water < ApplicationRecord
    belongs_to :user, optional: true
    has_many :journals
    has_many :plants, through: :journals
    validates :plant_family, :weeks, presence: true
end
