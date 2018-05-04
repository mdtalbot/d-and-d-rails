class MonsterEncounter < ApplicationRecord
  belongs_to :encounter
  belongs_to :monster
end
