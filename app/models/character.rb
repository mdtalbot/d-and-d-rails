class Character < ApplicationRecord
  has_many :character_encounters
  has_many :encounters, through: :character_encounter
  has_many :pets
  
  validates :name, :strength, :dexterity, :consitution, :intelligence, :wisdom, :charisma, presence: true
  validates :strength, :dexterity, :consitution, :intelligence, :wisdom, :charisma, inclusion: { in: 0..20, message: "value must be between 0 and 20."}
  validates :name, uniqueness: true
end
