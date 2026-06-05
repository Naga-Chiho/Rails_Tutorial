class RenameAddressColumnsInUsers < ActiveRecord::Migration[8.1]
  def change
    rename_column :users, :address1, :prefecture
    rename_column :users, :address2, :city
    rename_column :users, :address3, :town
    rename_column :users, :address4, :street
    rename_column :users, :address5, :building
  end
end
