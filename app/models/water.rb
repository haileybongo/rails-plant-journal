class Water < ApplicationRecord
    belongs_to :user, optional: true
    has_many :journals
    has_many :plants, through: :journals
    validates :plant_family, :weeks, presence: true
    validates :weeks, numericality: {less_than_or_equal_to: 6, greater_than_or_equal_to: 0}

end
