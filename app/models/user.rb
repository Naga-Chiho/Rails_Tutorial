class User < ApplicationRecord
  validates :name, presence: true
  validates :furigana, presence: true
  validates :gender, presence: true
  validates :phone, presence: true
  validates :postal_code, presence: true
  validates :address1, presence: true
  validates :address2, presence: true
  validates :address3, presence: true
  validates :address4, presence: true
  validates :birthday, presence: true

  validate :phone_or_mobile_phone
end