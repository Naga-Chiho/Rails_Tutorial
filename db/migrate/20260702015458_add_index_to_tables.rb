class AddIndexToTables < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :email, unique: true
    add_index :users, :name
    add_index :users, :prefecture
    add_index :users, :birthday
  end
end
