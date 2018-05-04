class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :strength
      t.integer :dexterity
      t.integer :consitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.timestamps
    end
  end
end
