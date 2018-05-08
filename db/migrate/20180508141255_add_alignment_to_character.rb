class AddAlignmentToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :alignment_id, :integer
  end
end
