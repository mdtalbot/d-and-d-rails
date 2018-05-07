class AddCharRaceToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :char_race_id, :integer
  end
end
