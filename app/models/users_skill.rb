# frozen_string_literal: true

class UsersSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
end
