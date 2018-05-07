class AddCharClassToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :char_class_id, :integer
  end
end
