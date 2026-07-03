# frozen_string_literal: true

class Department < ApplicationRecord
  has_many :users, dependent: :restrict_with_error
  validates :name, presence: { message: '名前は必須です' }
end
