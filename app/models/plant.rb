class Plant < ApplicationRecord
    belongs_to :user, optional: true
    has_many :journals
    has_many :waters, through: :journals
    validates :name, presence: true
    validates :difficulty, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 0}
    scope :most_difficult, -> { where("difficulty: > 3")}
end
