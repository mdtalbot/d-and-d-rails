class CharacterEncounter < ApplicationRecord
  belongs_to :encounter
  belongs_to :character
end
