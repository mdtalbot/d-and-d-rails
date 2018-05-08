class Pet < ApplicationRecord
  belongs_to :character
  delegate :user_id, to: :character

  validates :name, :description, :character_id, presence: true
  validates :name, uniqueness: true
end
