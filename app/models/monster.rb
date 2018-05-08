class Monster < ApplicationRecord
  has_many :monster_encounters
  has_many :encounters, through: :monster_encounters
  belongs_to :user, optional: true

  validates :name, :description, :hit_points, presence: true
  validates :hit_points, inclusion: { in: 1..500, message: "value must be between 1 and 500."}

<<<<<<< HEAD
=======

>>>>>>> 5f11c84ed3d0835182daa88c5c64a7741971dc0b
end
