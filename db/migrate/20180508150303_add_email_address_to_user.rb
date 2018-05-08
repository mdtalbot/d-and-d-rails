class AddEmailAddressToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email_address, :string
  end
end
