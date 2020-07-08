class Journal < ApplicationRecord
    has_one :plant
    has_one :water
    belongs_to :user
    accepts_nested_attributes_for :plant, :water

end
