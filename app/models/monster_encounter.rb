class MonsterEncounter < ApplicationRecord
  belongs_to :encounter
  belongs_to :monster

  validates :quantity, numericality: {in: 0..10}
end
