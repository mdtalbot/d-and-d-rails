class AddLevelToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :level, :integer, default: 1
  end
end
