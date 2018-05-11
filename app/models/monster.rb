class Monster < ApplicationRecord
  has_many :monster_encounters
  has_many :encounters, through: :monster_encounters
  belongs_to :user, optional: true

  # validates :name, :description, :hit_points, :size, :challenge_rating, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :armor_class, presence: true
  validates :hit_points, inclusion: { in: 1..500, message: "value must be between 1 and 500."}

  def stats
    {strength: strength, dexterity: dexterity, constitution: constitution, intelligence: intelligence, wisdom: wisdom, charisma: charisma}
  end

  def quantity_by_encounter(encounter)
    encounter.monster_encounters.find_by(monster_id: self.id).quantity
  end

  def monster_name_and_cr
    "#{name} || CR #{challenge_rating}"
  end

  MONSTER_SIZES = ["Tiny", "Small", "Medium", "Large", "Huge", "Gargantuan"]

  end
