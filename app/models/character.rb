class Character < ApplicationRecord
  has_many :character_encounters
  has_many :encounters, through: :character_encounter
  has_many :pets
  validates :name, :strength, :dexterity, :consitution, :intelligence, :wisdom, :charisma, presence: true
  validates :strength, :dexterity, :consitution, :intelligence, :wisdom, :charisma, inclusion: 0..20
  validates :name, uniqueness: true
end
