# frozen_string_literal: true

class ChangeUserSkillsToUsersSkills < ActiveRecord::Migration[8.1]
  def change
    rename_table :user_skills, :users_skills
  end
end
