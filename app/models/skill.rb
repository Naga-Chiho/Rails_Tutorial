class Skill < ApplicationRecord
    has_many :user_skills, dependent: :restrict_with_error
    has_many :users, through: :user_skills
    validates :name, presence: { message: "名前は必須です" }
end
