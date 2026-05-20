class Department < ApplicationRecord
    t.belongs_to :user, null: false, foreign_key: true
end
