class AddQuantityToMonsterEncounters < ActiveRecord::Migration[5.2]
  def change
    add_column :monster_encounters, :quantity, :integer, default: 1
  end
end
