class Department < ApplicationRecord
    has_many :users, dependent: :destroy
    validates :name, presence: { message: "名前は必須です" }
end
