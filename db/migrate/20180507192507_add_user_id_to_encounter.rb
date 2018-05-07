class AddUserIdToEncounter < ActiveRecord::Migration[5.2]
  def change
    add_column :encounters, :user_id, :integer
  end
end
