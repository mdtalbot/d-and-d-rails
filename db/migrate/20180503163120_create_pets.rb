class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :description
      t.integer :character_id
      t.timestamps
    end
  end
end
