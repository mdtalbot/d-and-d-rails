class Encounter < ApplicationRecord
  has_many :character_encounters
  has_many :characters, through: :character_encounters
  has_many :monster_encounters
  has_many :monsters, through: :monster_encounters
  belongs_to :user, optional: true

  validates :name, :content, presence: true
  validates :name, uniqueness: true
end
