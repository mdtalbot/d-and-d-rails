class Character < ApplicationRecord
  has_many :character_encounters
  has_many :encounters, through: :character_encounter
  has_many :pets
  belongs_to :char_class
  belongs_to :char_race
  belongs_to :user, optional: true

  validates :name, :strength, :dexterity, :consitution, :intelligence, :wisdom, :charisma, presence: true
  validates :strength, :dexterity, :consitution, :intelligence, :wisdom, :charisma, inclusion: { in: 0..20, message: "value must be between 0 and 20."}
  validates :name, uniqueness: true
end
