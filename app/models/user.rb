class User < ApplicationRecord
  validates :name, presence: true
  validates :furigana, presence: true
  validates :gender, presence: true
  validates :postal_code, presence: true
  validates :address1, presence: true
  validates :address2, presence: true
  validates :address3, presence: true
  validates :address4, presence: true
  validates :birthday, presence: true

  validate :phone_or_mobile_phone

  private

  def phone_or_mobile_phone
    return if phone.present? ^ mobile_phone.present?
    errors.add(:base, '携帯番号または電話番号のどちらか一方を入力してください')
  end
end