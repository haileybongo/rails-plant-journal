class Plant < ApplicationRecord
    belongs_to :user, optional: true
    has_many :journals
    has_many :waters, through: :journals
    validates :name, presence: true

end
