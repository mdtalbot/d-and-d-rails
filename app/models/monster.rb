class Monster < ApplicationRecord
  has_many :monster_encounters
  has_many :encounters, through: :monster_encounters
  validates :name, :description, :hit_points, presence: true
  validates :hit_points, inclusion: 1..500
end
