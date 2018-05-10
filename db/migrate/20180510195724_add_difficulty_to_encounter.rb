class AddDifficultyToEncounter < ActiveRecord::Migration[5.2]
  def change
    add_column :encounters, :difficulty, :string
  end
end
