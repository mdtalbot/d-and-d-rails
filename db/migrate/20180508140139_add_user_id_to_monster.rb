class AddUserIdToMonster < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :user_id, :integer
  end
end
