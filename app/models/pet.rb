class Pet < ApplicationRecord
  belongs_to :character
    validates :name, :description, :character_id, presence: true
end
