class CreateCharacterEncounters < ActiveRecord::Migration[5.2]
  def change
    create_table :character_encounters do |t|
      t.integer :character_id
      t.integer :encounter_id
      t.timestamps
    end
  end
end
