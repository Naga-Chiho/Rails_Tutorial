class Department < ApplicationRecord
    has_many :users
    validates :name, presence: { message: "名前は必須です" }
end
