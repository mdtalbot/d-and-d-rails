class CreateMonsterEncounters < ActiveRecord::Migration[5.2]
  def change
    create_table :monster_encounters do |t|
      t.integer :monster_id
      t.integer :encounter_id
      t.timestamps
    end
  end
end
