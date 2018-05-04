class Encounter < ApplicationRecord
  has_many :character_encounters
  has_many :characters, through: :character_encounters
  has_many :monster_encounters
  has_many :monsters, through: :monster_encounters
  validates :name, presence: true
  validates :content, presence: true
end
