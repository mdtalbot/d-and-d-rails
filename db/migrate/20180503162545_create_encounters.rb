class CreateEncounters < ActiveRecord::Migration[5.2]
  def change
    create_table :encounters do |t|
      t.string :name
      t.string :content
      t.timestamps
    end
  end
end
