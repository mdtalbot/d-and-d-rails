class Monster < ApplicationRecord
  has_many :monster_encounters
  has_many :encounters, through: :monster_encounters
  belongs_to :user, optional: true

  validates :name, :description, :hit_points, :size, :challenge_rating, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :armor_class, presence: true
  validates :hit_points, inclusion: { in: 1..500, message: "value must be between 1 and 500."}
end
