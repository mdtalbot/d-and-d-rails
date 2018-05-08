class AddExpToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :experience, :integer, default: 0
  end
end
