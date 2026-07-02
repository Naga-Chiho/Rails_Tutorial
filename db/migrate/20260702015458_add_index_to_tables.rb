class AddIndexToTables < ActiveRecord::Migration[7.0]
  def change
    # add_index :users, :department_id
    add_index :users, :email, unique: true

    # add_index :user_skills, :user_id
    # add_index :user_skills, :skill_id
  end
end